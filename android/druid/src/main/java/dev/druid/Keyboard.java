package dev.druid;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

/**
 * The soft keyboard, for apps that draw their own text fields (RUI does). On a
 * NativeActivity the typed keys then arrive in the native input queue.
 */
public final class Keyboard {
    private Keyboard() {}

    private static InputMethodManager imm() {
        return (InputMethodManager) Druid.context().getSystemService(Context.INPUT_METHOD_SERVICE);
    }

    private static View focusView() {
        Activity a = Druid.activity();
        if (a == null || a.getWindow() == null) return null;
        View v = a.getWindow().getCurrentFocus();
        return v != null ? v : a.getWindow().getDecorView();
    }

    /** False when there is no Activity window to show it for. */
    @SuppressWarnings("deprecation")
    public static boolean show() throws Exception {
        return Druid.onMain(() -> {
            View v = focusView();
            if (v == null) return false;
            v.setFocusable(true);
            v.setFocusableInTouchMode(true);
            v.requestFocus();
            if (!imm().showSoftInput(v, InputMethodManager.SHOW_IMPLICIT)) {
                // A NativeActivity's decor view is not a text editor; forcing works there.
                imm().toggleSoftInput(InputMethodManager.SHOW_FORCED, 0);
            }
            return true;
        });
    }

    public static boolean hide() throws Exception {
        return Druid.onMain(() -> {
            View v = focusView();
            return v != null && imm().hideSoftInputFromWindow(v.getWindowToken(), 0);
        });
    }

    public static boolean isActive() { return imm().isActive(); }
}
