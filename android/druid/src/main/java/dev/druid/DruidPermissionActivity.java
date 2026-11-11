package dev.druid;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;

/**
 * An invisible Activity that asks for runtime permissions and reports the
 * answer as a "permission" event, then finishes. It exists because the Activity
 * that wants a permission may not be able to receive the result: a
 * NativeActivity (RUI's RuiActivity) has no onRequestPermissionsResult to override.
 */
public class DruidPermissionActivity extends Activity {
    public static final String EXTRA_PERMISSIONS = "dev.druid.permissions";
    public static final String EXTRA_REQUEST_ID = "dev.druid.requestId";
    private static final int CODE = 0x4472;   // "Dr"

    private String[] permissions = new String[0];
    private int requestId;
    private boolean answered;

    @Override protected void onCreate(Bundle saved) {
        super.onCreate(saved);
        // Plumbing, not the app's Activity: do not become Druid's current one
        // (the Activity underneath stays it), only make sure Druid is started.
        if (!Druid.isInitialized()) Druid.init(getApplicationContext());
        String[] p = getIntent().getStringArrayExtra(EXTRA_PERMISSIONS);
        permissions = p == null ? new String[0] : p;
        requestId = getIntent().getIntExtra(EXTRA_REQUEST_ID, 0);
        if (saved != null) return;   // recreated mid-dialog: the system still answers
        if (permissions.length == 0 || Build.VERSION.SDK_INT < 23) {
            answer(null);
        } else {
            requestPermissions(permissions, CODE);
        }
    }

    @Override public void onRequestPermissionsResult(int code, String[] perms, int[] results) {
        if (code != CODE) return;
        // An empty result means the request was interrupted: report it as denied.
        answer(results.length == permissions.length ? results : denied());
    }

    /** Posts the event and finishes. {@code results} null: read the current state (no dialog was needed). */
    private void answer(int[] results) {
        if (answered) return;
        answered = true;
        Permissions.postResult(requestId, permissions, results);
        finish();
        overridePendingTransition(0, 0);
    }

    private int[] denied() {
        int[] r = new int[permissions.length];
        java.util.Arrays.fill(r, android.content.pm.PackageManager.PERMISSION_DENIED);
        return r;
    }

    @Override protected void onDestroy() {
        // Finished without an answer (the user left): the caller still hears back.
        if (!answered && isFinishing()) {
            answered = true;
            Permissions.postResult(requestId, permissions, denied());
        }
        super.onDestroy();
    }
}
