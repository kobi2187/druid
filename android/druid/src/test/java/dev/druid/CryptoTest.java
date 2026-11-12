package dev.druid;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import org.junit.Test;

public class CryptoTest extends DruidTestBase {
    private static String hex(byte[] b) {
        StringBuilder s = new StringBuilder();
        for (byte x : b) s.append(String.format("%02x", x));
        return s.toString();
    }
    private static byte[] u(String s) { return s.getBytes(StandardCharsets.UTF_8); }

    @Test public void knownDigests() throws Exception {
        assertEquals("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", hex(Crypto.digest("SHA-256", new byte[0])));
        assertEquals("a9993e364706816aba3e25717850c26c9cd0d89d", hex(Crypto.digest("SHA-1", u("abc"))));
        assertEquals("900150983cd24fb0d6963f7d28e17f72", hex(Crypto.digest("MD5", u("abc"))));
        assertEquals(64, Crypto.digest("SHA-512", u("abc")).length);
    }

    @Test(expected = java.security.NoSuchAlgorithmException.class)
    public void unknownDigest() throws Exception { Crypto.digest("SHA-999", new byte[0]); }

    @Test public void hmacRfc4231Case2() throws Exception {
        assertEquals("5bdcc146bf60754e6a042426089575c75a003f089d2739839dec58b964ec3843",
                     hex(Crypto.hmac("HmacSHA256", u("Jefe"), u("what do ya want for nothing?"))));
    }

    @Test public void randomness() {
        assertEquals(0, Crypto.randomBytes(-3).length);
        assertEquals(32, Crypto.randomBytes(32).length);
        assertFalse(java.util.Arrays.equals(Crypto.randomBytes(16), Crypto.randomBytes(16)));
        String id = Crypto.uuid();
        assertTrue(id, id.matches("[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}"));
    }

    @Test public void base64() {
        byte[] data = { (byte) 0xfb, (byte) 0xff, 0x01 };
        assertEquals("+/8B", Crypto.base64Encode(data, false));
        assertEquals("-_8B", Crypto.base64Encode(data, true));
        assertArrayEquals(data, Crypto.base64Decode("+/8B", false));
        assertArrayEquals(data, Crypto.base64Decode("-_8B", true));
        assertEquals("aQ", Crypto.base64Encode(new byte[] { 'i' }, true));     // no padding
    }
}
