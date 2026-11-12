package dev.druid;

import static org.junit.Assert.*;

import android.os.Environment;
import org.junit.Test;
import org.robolectric.shadows.ShadowStatFs;

public class StorageTest extends DruidTestBase {
    @Test public void directories() {
        assertEquals(app.getFilesDir().getAbsolutePath(), Storage.filesDir());
        assertEquals(app.getCacheDir().getAbsolutePath(), Storage.cacheDir());
        assertEquals(app.getNoBackupFilesDir().getAbsolutePath(), Storage.noBackupDir());
        assertEquals(app.getCodeCacheDir().getAbsolutePath(), Storage.codeCacheDir());
        assertEquals(app.getDataDir().getAbsolutePath(), Storage.dataDir());
        assertEquals(app.getExternalFilesDir(null).getAbsolutePath(), Storage.externalFilesDir(""));
        assertEquals(app.getExternalFilesDir(null).getAbsolutePath(), Storage.externalFilesDir(null));
        assertTrue(Storage.externalFilesDir(Environment.DIRECTORY_MUSIC).endsWith("Music"));
        assertEquals(app.getExternalCacheDir().getAbsolutePath(), Storage.externalCacheDir());
        assertEquals(Environment.getExternalStorageState(), Storage.externalState());
    }

    @Test public void space() {
        ShadowStatFs.registerStats(Storage.filesDir(), 100, 30, 20);
        assertEquals(20L * 4096, Storage.freeBytes(Storage.filesDir()));
        assertEquals(100L * 4096, Storage.totalBytes(Storage.filesDir()));
    }
}
