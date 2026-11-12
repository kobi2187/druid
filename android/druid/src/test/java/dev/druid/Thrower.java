package dev.druid;

/** Test-only: Java failures for the Nim side to meet. */
public final class Thrower {
    private Thrower() {}
    public static void security() { throw new SecurityException("needs CAMERA"); }
}
