package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.view.inputmethod.InputMethodManager;
import org.junit.Test;
import org.robolectric.Robolectric;

public class KeyboardTest extends DruidTestBase {
    private InputMethodManager imm() { return (InputMethodManager) app.getSystemService(Context.INPUT_METHOD_SERVICE); }

    @Test public void needsAnActivityWindow() throws Exception {
        assertFalse(Keyboard.show());
        assertFalse(Keyboard.hide());
    }

    @Test public void showAndHideOverAnActivity() throws Exception {
        Druid.init(Robolectric.buildActivity(Activity.class).setup().get());
        assertTrue(Keyboard.show());
        assertTrue(shadowOf(imm()).isSoftInputVisible());
        Keyboard.hide();
        assertFalse(shadowOf(imm()).isSoftInputVisible());
        Keyboard.isActive();         // answers without a focused editor
    }
}
