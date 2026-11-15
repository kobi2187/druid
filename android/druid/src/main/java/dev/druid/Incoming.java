package dev.druid;

import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * What other apps hand to this one: text or files shared to it (ACTION_SEND,
 * ACTION_SEND_MULTIPLE) and links or files opened with it (ACTION_VIEW).
 * Each becomes an "incoming" event: action ("send", "view"), MIME type,
 * subject, text, URL, then the paths of the files, copied into the cache
 * (a content:// URI from another app is not readable for long).
 *
 * <p>The app's manifest decides what it receives, with intent filters on its
 * Activity. Druid sees the Intent an Activity starts with; for one delivered
 * to a running Activity, call {@link Druid#newIntent} from its onNewIntent.
 */
public final class Incoming {
    private Incoming() {}

    static final String DIR = "druid_incoming";

    /** Reports `i` if it carries something for the app; copies its files off the main thread. */
    static void read(Intent i) {
        String action = i.getAction();
        if (action == null) return;
        final String kind;
        switch (action) {
            case Intent.ACTION_SEND: case Intent.ACTION_SEND_MULTIPLE: kind = "send"; break;
            case Intent.ACTION_VIEW: kind = "view"; break;
            default: return;
        }
        String mime = i.getType() == null ? "" : i.getType();
        String subject = nz(i.getStringExtra(Intent.EXTRA_SUBJECT));
        CharSequence t = i.getCharSequenceExtra(Intent.EXTRA_TEXT);
        String text = t == null ? "" : t.toString();
        List<Uri> uris = uris(i, kind);
        String url = kind.equals("view") && i.getData() != null && !isContent(i.getData()) ? i.getData().toString() : "";
        if (uris.isEmpty()) {
            post(kind, mime, subject, text, url, new ArrayList<>());
            return;
        }
        ContentResolver cr = Druid.context().getContentResolver();
        new Thread(() -> {
            List<String> paths = new ArrayList<>();
            for (Uri u : uris) {
                try { paths.add(copy(cr, u)); } catch (Exception e) { paths.add("!" + e); }
            }
            post(kind, mime, subject, text, url, paths);
        }, "druid-incoming").start();
    }

    @SuppressWarnings("deprecation")
    private static List<Uri> uris(Intent i, String kind) {
        List<Uri> out = new ArrayList<>();
        if (Intent.ACTION_SEND_MULTIPLE.equals(i.getAction())) {
            ArrayList<Uri> many = i.getParcelableArrayListExtra(Intent.EXTRA_STREAM);
            if (many != null) out.addAll(many);
        } else if (kind.equals("send")) {
            Uri one = i.getParcelableExtra(Intent.EXTRA_STREAM);
            if (one != null) out.add(one);
        } else if (i.getData() != null && isContent(i.getData())) {
            out.add(i.getData());
        }
        return out;
    }

    private static boolean isContent(Uri u) {
        return "content".equals(u.getScheme()) || "file".equals(u.getScheme());
    }

    private static void post(String kind, String mime, String subject, String text, String url, List<String> paths) {
        Object[] f = new Object[5 + paths.size()];
        f[0] = kind; f[1] = mime; f[2] = subject; f[3] = text; f[4] = url;
        for (int k = 0; k < paths.size(); k++) f[5 + k] = paths.get(k);
        Druid.post("incoming", f);
    }

    /** Copies `u` into the cache, under its display name; returns the path. */
    static String copy(ContentResolver cr, Uri u) throws Exception {
        String name = displayName(cr, u);
        File dir = new File(Druid.context().getCacheDir(), DIR);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new java.io.IOException("cannot create " + dir);
        File out = new File(dir, name);
        for (int n = 2; out.exists(); n++) out = new File(dir, n + "-" + name);
        try (InputStream in = cr.openInputStream(u); FileOutputStream os = new FileOutputStream(out)) {
            if (in == null) throw new java.io.FileNotFoundException(u.toString());
            byte[] buf = new byte[64 * 1024];
            for (int r; (r = in.read(buf)) > 0; ) os.write(buf, 0, r);
        }
        return out.getAbsolutePath();
    }

    private static String displayName(ContentResolver cr, Uri u) {
        String name = null;
        if ("content".equals(u.getScheme())) {
            try (Cursor c = cr.query(u, new String[] { OpenableColumns.DISPLAY_NAME }, null, null, null)) {
                if (c != null && c.moveToFirst()) name = c.getString(0);
            } catch (RuntimeException ignored) {}
        }
        if (name == null) name = u.getLastPathSegment();
        if (name == null || name.isEmpty()) name = "shared";
        return name.replace('/', '_').replace('\\', '_');
    }

    /** Deletes the copied files (they are the app's to keep or move). */
    public static void clearCopies() {
        File[] files = new File(Druid.context().getCacheDir(), DIR).listFiles();
        if (files != null) for (File f : files) f.delete();
    }

    private static String nz(String s) { return s == null ? "" : s; }
}
