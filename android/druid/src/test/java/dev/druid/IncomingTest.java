package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

public class IncomingTest extends DruidTestBase {
    /** Waits for the copying thread to post. */
    private List<String[]> incoming() throws Exception {
        for (int k = 0; k < 200; k++) {
            if (Druid.pendingEvents() > 0) break;
            Thread.sleep(10);
        }
        return events("incoming");
    }

    private Uri file(String name, String text) throws Exception {
        File f = new File(app.getFilesDir(), name);
        try (FileOutputStream o = new FileOutputStream(f)) { o.write(text.getBytes(StandardCharsets.UTF_8)); }
        return Uri.fromFile(f);
    }

    @Test public void sharedText() throws Exception {
        Intent i = new Intent(Intent.ACTION_SEND).setType("text/plain")
            .putExtra(Intent.EXTRA_TEXT, "look at this").putExtra(Intent.EXTRA_SUBJECT, "Nim");
        Incoming.read(i);
        List<String[]> ev = incoming();
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "incoming", "send", "text/plain", "Nim", "look at this", "" }, ev.get(0));
    }

    @Test public void sharedFilesAreCopied() throws Exception {
        Intent one = new Intent(Intent.ACTION_SEND).setType("text/plain")
            .putExtra(Intent.EXTRA_STREAM, file("a.txt", "alpha"));
        Incoming.read(one);
        String[] e = incoming().get(0);
        assertEquals(7, e.length);
        assertTrue(e[6].contains(Incoming.DIR));
        assertEquals("alpha", new String(Files.readAllBytes(new File(e[6]).toPath()), StandardCharsets.UTF_8));

        ArrayList<Uri> many = new ArrayList<>();
        many.add(file("b.txt", "beta"));
        many.add(file("a.txt", "again"));        // same name: a second copy beside the first
        many.add(Uri.fromFile(new File(app.getFilesDir(), "missing.txt")));
        Intent multi = new Intent(Intent.ACTION_SEND_MULTIPLE).setType("*/*")
            .putParcelableArrayListExtra(Intent.EXTRA_STREAM, many);
        Incoming.read(multi);
        e = incoming().get(0);
        assertEquals(9, e.length);
        assertTrue(e[6].endsWith("b.txt"));
        assertTrue(e[7].endsWith("2-a.txt"));
        assertEquals("again", new String(Files.readAllBytes(new File(e[7]).toPath()), StandardCharsets.UTF_8));
        assertTrue(e[8].startsWith("!"));            // could not be read: said so
        Incoming.clearCopies();
        assertEquals(0, new File(app.getCacheDir(), Incoming.DIR).listFiles().length);
    }

    @Test public void aLinkOpenedWithTheApp() throws Exception {
        Incoming.read(new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/a?b=1")));
        assertArrayEquals(new String[] { "incoming", "view", "", "", "", "https://example.com/a?b=1" }, incoming().get(0));
    }

    @Test public void aFileOpenedWithTheAppIsCopied() throws Exception {
        Intent i = new Intent(Intent.ACTION_VIEW).setDataAndType(file("doc.md", "# hi"), "text/markdown");
        Incoming.read(i);
        String[] e = incoming().get(0);
        assertEquals("text/markdown", e[2]);
        assertEquals("", e[5]);                      // not a link
        assertTrue(e[6].endsWith("doc.md"));
    }

    @Test public void otherIntentsAreNotReported() throws Exception {
        Incoming.read(new Intent(Intent.ACTION_MAIN));
        Incoming.read(new Intent());
        Thread.sleep(20);
        assertEquals(0, events("incoming").size());
    }

    @Test public void anActivityStartedByAShareReportsIt() throws Exception {
        Intent share = new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, "hi");
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class, share).create().start().resume();
        List<String[]> ev = incoming();
        assertEquals(1, ev.size());
        assertEquals("hi", ev.get(0)[4]);
        Druid.newIntent(c.get(), new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, "again"));
        assertEquals("again", incoming().get(0)[4]);
        c.pause().stop().destroy();
    }
}
