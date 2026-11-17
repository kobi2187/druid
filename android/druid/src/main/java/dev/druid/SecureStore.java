package dev.druid;

import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Collections;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * Secrets (tokens, passwords) encrypted with an AES-256-GCM key that lives in
 * the Android Keystore: the key never leaves the device's secure hardware (or
 * its software keystore), and the ciphertext is stored in private prefs.
 *
 * <p>A value that can no longer be decrypted -- restored from a backup onto
 * another device, where the key is not -- reads as absent.
 */
public final class SecureStore {
    private SecureStore() {}

    static final String ALIAS = "dev.druid.secure";
    private static final String FILE = "dev.druid.secure";

    /** Where the key comes from: the Android Keystore (tests use a software key). */
    interface Keys { SecretKey key() throws Exception; }
    static Keys keys = SecureStore::keystoreKey;

    static SecretKey keystoreKey() throws Exception {
        KeyStore ks = KeyStore.getInstance("AndroidKeyStore");
        ks.load(null);
        if (ks.containsAlias(ALIAS)) return (SecretKey) ks.getKey(ALIAS, null);
        KeyGenerator g = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
        g.init(new KeyGenParameterSpec.Builder(ALIAS, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
            .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
            .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
            .setKeySize(256)
            .build());
        return g.generateKey();
    }

    private static SharedPreferences prefs() { return Druid.context().getSharedPreferences(FILE, 0); }

    public static synchronized void put(String name, byte[] value) throws Exception {
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
        c.init(Cipher.ENCRYPT_MODE, keys.key());
        c.updateAAD(name.getBytes(StandardCharsets.UTF_8));       // a value cannot be moved to another name
        byte[] iv = c.getIV();
        byte[] ct = c.doFinal(value);
        byte[] all = new byte[1 + iv.length + ct.length];
        all[0] = (byte) iv.length;
        System.arraycopy(iv, 0, all, 1, iv.length);
        System.arraycopy(ct, 0, all, 1 + iv.length, ct.length);
        if (!prefs().edit().putString(name, Base64.encodeToString(all, Base64.NO_WRAP)).commit()) {
            throw new java.io.IOException("could not store " + name);
        }
    }

    /** The value, or null if there is none (or it cannot be decrypted any more). */
    public static synchronized byte[] get(String name) throws Exception {
        String s = prefs().getString(name, null);
        if (s == null) return null;
        try {
            byte[] all = Base64.decode(s, Base64.NO_WRAP);
            int n = all[0];
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.DECRYPT_MODE, keys.key(), new GCMParameterSpec(128, all, 1, n));
            c.updateAAD(name.getBytes(StandardCharsets.UTF_8));
            return c.doFinal(all, 1 + n, all.length - 1 - n);
        } catch (GeneralSecurityException | IllegalArgumentException | ArrayIndexOutOfBoundsException e) {
            prefs().edit().remove(name).commit();
            return null;
        }
    }

    public static boolean contains(String name) { return prefs().contains(name); }
    public static void remove(String name) { prefs().edit().remove(name).commit(); }
    public static void clear() { prefs().edit().clear().commit(); }

    public static String[] names() {
        ArrayList<String> n = new ArrayList<>(prefs().getAll().keySet());
        Collections.sort(n);
        return n.toArray(new String[0]);
    }
}
