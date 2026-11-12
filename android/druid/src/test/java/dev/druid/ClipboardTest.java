package dev.druid;

import static org.junit.Assert.*;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import org.junit.Test;

public class ClipboardTest extends DruidTestBase {
    private ClipboardManager cm() { return (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE); }

    @Test public void setAndGetText() throws Exception {
        Clipboard.setText("label", "hello ✓");
        assertEquals("hello ✓", Clipboard.getText());
        assertEquals("label", cm().getPrimaryClip().getDescription().getLabel().toString());
        assertTrue(Clipboard.hasText());
    }

    @Test public void emptyClipboardHasNoText() throws Exception {
        Clipboard.clear();
        assertFalse(Clipboard.hasText());
        assertNull(Clipboard.getText());
    }

    @Test public void nonTextClipIsNotText() throws Exception {
        cm().setPrimaryClip(ClipData.newRawUri("uri", android.net.Uri.parse("content://x/1")));
        assertFalse(Clipboard.hasText());
        // Coerced as Android's paste does: the URI's text, or nothing when it
        // cannot be read (an empty coercion is "no text").
        String t = Clipboard.getText();
        assertTrue(t, t == null || t.startsWith("content://"));
    }

    @Test public void worksFromABackgroundThread() throws Throwable {
        Throwable[] err = new Throwable[1];
        Thread t = new Thread(() -> {
            try { Clipboard.setText("t", "from a worker"); } catch (Throwable e) { err[0] = e; }
        });
        t.start();
        for (int k = 0; k < 200 && t.isAlive(); k++) { idle(); t.join(10); }
        if (err[0] != null) throw err[0];
        assertEquals("from a worker", Clipboard.getText());
    }
}
