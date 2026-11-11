package dev.druid;

import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;

/**
 * Background downloads by the system DownloadManager, which survive the app.
 * Completion is a "download" event: (id, status, local uri).
 */
public final class Downloads {
    private Downloads() {}

    private static DownloadManager dm() {
        return (DownloadManager) Druid.context().getSystemService(Context.DOWNLOAD_SERVICE);
    }

    private static boolean listening;

    private static synchronized void listen() {
        if (listening) return;
        BroadcastReceiver r = new BroadcastReceiver() {
            @Override public void onReceive(Context c, Intent i) {
                long id = i.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1);
                if (id < 0) return;
                long[] s = status(id);
                Druid.post("download", id, s[0], localUri(id));
            }
        };
        IntentFilter f = new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE);
        if (Build.VERSION.SDK_INT >= 33) Druid.context().registerReceiver(r, f, Context.RECEIVER_EXPORTED);
        else Druid.context().registerReceiver(r, f);
        listening = true;
    }

    /**
     * Downloads {@code url} into the app's external files directory as {@code fileName}
     * (no storage permission needed). {@code wifiOnly} keeps it off mobile data.
     */
    public static long enqueue(String url, String fileName, String title, boolean wifiOnly) {
        listen();
        DownloadManager.Request r = new DownloadManager.Request(Uri.parse(url));
        if (title != null && !title.isEmpty()) r.setTitle(title);
        r.setDestinationInExternalFilesDir(Druid.context(), null, fileName);
        r.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
        if (wifiOnly) r.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_WIFI);
        return dm().enqueue(r);
    }

    /** {status (DownloadManager.STATUS_*: 1 pending, 2 running, 4 paused, 8 successful, 16 failed; 0 unknown id), bytes so far, total bytes (-1 unknown)}. */
    public static long[] status(long id) {
        try (Cursor c = dm().query(new DownloadManager.Query().setFilterById(id))) {
            if (c == null || !c.moveToFirst()) return new long[] { 0, 0, -1 };
            return new long[] {
                c.getInt(c.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS)),
                c.getLong(c.getColumnIndexOrThrow(DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR)),
                c.getLong(c.getColumnIndexOrThrow(DownloadManager.COLUMN_TOTAL_SIZE_BYTES)) };
        }
    }

    public static String localUri(long id) {
        try (Cursor c = dm().query(new DownloadManager.Query().setFilterById(id))) {
            if (c == null || !c.moveToFirst()) return "";
            String u = c.getString(c.getColumnIndexOrThrow(DownloadManager.COLUMN_LOCAL_URI));
            return u == null ? "" : u;
        }
    }

    public static int remove(long id) { return dm().remove(id); }
}
