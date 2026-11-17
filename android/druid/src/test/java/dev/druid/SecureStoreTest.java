package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.SharedPreferences;
import java.nio.charset.StandardCharsets;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/** Robolectric has no Android Keystore: the same code with a software AES key. */
public class SecureStoreTest extends DruidTestBase {
    private SecureStore.Keys real;

    @Before public void softwareKey() throws Exception {
        real = SecureStore.keys;
        KeyGenerator g = KeyGenerator.getInstance("AES");
        g.init(256);
        SecretKey k = g.generateKey();
        SecureStore.keys = () -> k;
        SecureStore.clear();
    }

    @After public void restore() { SecureStore.keys = real; }

    private SharedPreferences raw() { return app.getSharedPreferences("dev.druid.secure", 0); }

    @Test public void roundTripsAndIsNotStoredInTheClear() throws Exception {
        byte[] secret = "my-token-123".getBytes(StandardCharsets.UTF_8);
        SecureStore.put("token", secret);
        assertArrayEquals(secret, SecureStore.get("token"));
        String stored = raw().getString("token", "");
        assertFalse(stored.contains("my-token"));
        SecureStore.put("token", secret);                  // a new IV each time
        assertNotEquals(stored, raw().getString("token", ""));
        SecureStore.put("empty", new byte[0]);
        assertArrayEquals(new byte[0], SecureStore.get("empty"));
        assertArrayEquals(new String[] { "empty", "token" }, SecureStore.names());
        assertTrue(SecureStore.contains("token"));
        SecureStore.remove("token");
        assertNull(SecureStore.get("token"));
        SecureStore.clear();
        assertArrayEquals(new String[0], SecureStore.names());
    }

    @Test public void aValueMovedToAnotherNameDoesNotDecrypt() throws Exception {
        SecureStore.put("a", new byte[] { 1, 2, 3 });
        raw().edit().putString("b", raw().getString("a", "")).commit();
        assertNull(SecureStore.get("b"));
        assertFalse(SecureStore.contains("b"));             // dropped
        assertArrayEquals(new byte[] { 1, 2, 3 }, SecureStore.get("a"));
    }

    @Test public void undecryptableValuesReadAsAbsent() throws Exception {
        SecureStore.put("a", new byte[] { 9 });
        KeyGenerator g = KeyGenerator.getInstance("AES");
        g.init(256);
        SecretKey other = g.generateKey();
        SecureStore.keys = () -> other;                     // as after a restore on another phone
        assertNull(SecureStore.get("a"));
        raw().edit().putString("junk", "not base64!").commit();
        assertNull(SecureStore.get("junk"));
    }
}
