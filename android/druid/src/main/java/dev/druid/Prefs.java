package dev.druid;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.Set;

/**
 * Small key-value settings that survive restarts (SharedPreferences). Writes
 * are committed before returning. {@code file} "" is the app's default file.
 */
public final class Prefs {
    private Prefs() {}

    private static SharedPreferences sp(String file) {
        String name = file == null || file.isEmpty() ? Druid.context().getPackageName() + "_druid" : file;
        return Druid.context().getSharedPreferences(name, Context.MODE_PRIVATE);
    }

    public static boolean contains(String file, String key) { return sp(file).contains(key); }

    public static String getString(String file, String key, String def) {
        try { return sp(file).getString(key, def); } catch (ClassCastException e) { return def; }
    }
    public static long getLong(String file, String key, long def) {
        try { return sp(file).getLong(key, def); } catch (ClassCastException e) { return def; }
    }
    public static double getDouble(String file, String key, double def) {
        // Doubles are stored as their bits in a long: SharedPreferences has only float.
        try {
            return sp(file).contains(key)
                ? Double.longBitsToDouble(sp(file).getLong(key, Double.doubleToRawLongBits(def))) : def;
        } catch (ClassCastException e) { return def; }
    }
    public static boolean getBool(String file, String key, boolean def) {
        try { return sp(file).getBoolean(key, def); } catch (ClassCastException e) { return def; }
    }

    public static boolean putString(String file, String key, String v) { return sp(file).edit().putString(key, v).commit(); }
    public static boolean putLong(String file, String key, long v) { return sp(file).edit().putLong(key, v).commit(); }
    public static boolean putDouble(String file, String key, double v) {
        return sp(file).edit().putLong(key, Double.doubleToRawLongBits(v)).commit();
    }
    public static boolean putBool(String file, String key, boolean v) { return sp(file).edit().putBoolean(key, v).commit(); }

    public static boolean remove(String file, String key) { return sp(file).edit().remove(key).commit(); }
    public static boolean clear(String file) { return sp(file).edit().clear().commit(); }

    public static String[] keys(String file) {
        Set<String> k = sp(file).getAll().keySet();
        return k.toArray(new String[0]);
    }
}
