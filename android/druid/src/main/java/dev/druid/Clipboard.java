package dev.druid;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;

/** Copy and paste plain text. Runs on the main thread (ClipboardManager wants a Looper). */
public final class Clipboard {
    private Clipboard() {}

    private static ClipboardManager cm() {
        return (ClipboardManager) Druid.context().getSystemService(Context.CLIPBOARD_SERVICE);
    }

    public static void setText(String label, String text) throws Exception {
        Druid.onMain(() -> cm().setPrimaryClip(ClipData.newPlainText(label, text)));
    }

    /** The clip's text, or null when there is none (or it is not text). */
    public static String getText() throws Exception {
        return Druid.onMain(() -> {
            ClipData c = cm().getPrimaryClip();
            if (c == null || c.getItemCount() == 0) return null;
            CharSequence t = c.getItemAt(0).coerceToText(Druid.context());
            return t == null ? null : t.toString();
        });
    }

    public static boolean hasText() throws Exception {
        return Druid.onMain(() -> {
            ClipboardManager m = cm();
            return m.hasPrimaryClip() && m.getPrimaryClip() != null
                && m.getPrimaryClip().getItemCount() > 0
                && m.getPrimaryClip().getItemAt(0).getText() != null;
        });
    }

    public static void clear() throws Exception {
        Druid.onMain(() -> {
            if (Build.VERSION.SDK_INT >= 28) cm().clearPrimaryClip();
            else cm().setPrimaryClip(ClipData.newPlainText("", ""));
        });
    }
}
