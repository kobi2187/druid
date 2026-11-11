package dev.druid;

import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import java.io.File;

/** Where the app may keep files, and how much room there is. Plain paths; read and write them from Nim. */
public final class Storage {
    private Storage() {}

    private static String path(File f) { return f == null ? "" : f.getAbsolutePath(); }

    public static String filesDir() { return path(Druid.context().getFilesDir()); }
    public static String cacheDir() { return path(Druid.context().getCacheDir()); }
    public static String noBackupDir() { return path(Druid.context().getNoBackupFilesDir()); }
    public static String codeCacheDir() { return path(Druid.context().getCodeCacheDir()); }
    public static String dataDir() { return path(Druid.context().getDataDir()); }
    /** App-specific external directory (no permission needed); {@code type} e.g. "Pictures", or "" for the root. "" if unavailable. */
    public static String externalFilesDir(String type) {
        return path(Druid.context().getExternalFilesDir(type == null || type.isEmpty() ? null : type));
    }
    public static String externalCacheDir() { return path(Druid.context().getExternalCacheDir()); }
    /** Environment.MEDIA_* ("mounted", "removed", ...). */
    public static String externalState() { return Environment.getExternalStorageState(); }

    public static long freeBytes(String path) { return new StatFs(path).getAvailableBytes(); }
    public static long totalBytes(String path) { return new StatFs(path).getTotalBytes(); }
}
