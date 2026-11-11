package dev.druid;

import android.util.Base64;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.UUID;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/** Hashes, MACs and randomness from the platform's providers. */
public final class Crypto {
    private Crypto() {}

    private static final SecureRandom random = new SecureRandom();

    /** {@code algorithm}: "SHA-256", "SHA-512", "SHA-1", "MD5". */
    public static byte[] digest(String algorithm, byte[] data) throws Exception {
        return MessageDigest.getInstance(algorithm).digest(data);
    }

    /** {@code algorithm}: "HmacSHA256", "HmacSHA512", "HmacSHA1". */
    public static byte[] hmac(String algorithm, byte[] key, byte[] data) throws Exception {
        Mac m = Mac.getInstance(algorithm);
        m.init(new SecretKeySpec(key, algorithm));
        return m.doFinal(data);
    }

    public static byte[] randomBytes(int n) {
        byte[] b = new byte[Math.max(0, n)];
        random.nextBytes(b);
        return b;
    }

    public static String uuid() { return UUID.randomUUID().toString(); }

    public static String base64Encode(byte[] data, boolean urlSafe) {
        return Base64.encodeToString(data, Base64.NO_WRAP | (urlSafe ? Base64.URL_SAFE | Base64.NO_PADDING : 0));
    }

    public static byte[] base64Decode(String s, boolean urlSafe) {
        return Base64.decode(s, urlSafe ? Base64.URL_SAFE : Base64.DEFAULT);
    }
}
