package dev.druid;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;

/**
 * Runtime permissions. {@link #request} shows the system dialog through
 * {@link DruidPermissionActivity}, so it works from any Activity -- a
 * NativeActivity, which cannot receive the result itself, included. The answer
 * arrives as a "permission" event: request id, then (permission, 1|0) pairs.
 */
public final class Permissions {
    private Permissions() {}

    public static boolean check(String permission) {
        if (Build.VERSION.SDK_INT < 23) return true;
        return Druid.context().checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED;
    }

    /** Whether the system would show a rationale first; false without an Activity. */
    public static boolean shouldShowRationale(String permission) {
        Activity a = Druid.activity();
        if (a == null || Build.VERSION.SDK_INT < 23) return false;
        return a.shouldShowRequestPermissionRationale(permission);
    }

    /**
     * Ask for {@code permissions}; the result is a "permission" event carrying
     * {@code requestId}. When all are already granted the event is posted at once.
     */
    public static void request(String[] permissions, int requestId) {
        boolean all = true;
        for (String p : permissions) all &= check(p);
        if (all) {
            postResult(requestId, permissions, null);
            return;
        }
        Activity a = Druid.activity();
        Intent i = new Intent(a != null ? a : Druid.context(), DruidPermissionActivity.class);
        i.putExtra(DruidPermissionActivity.EXTRA_PERMISSIONS, permissions);
        i.putExtra(DruidPermissionActivity.EXTRA_REQUEST_ID, requestId);
        if (a == null) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        (a != null ? a : Druid.context()).startActivity(i);
    }

    /** Opens this app's page in the system settings, where denied permissions can be granted. */
    public static void openSettings() { Intents.openAppSettings(); }

    static void postResult(int requestId, String[] permissions, int[] results) {
        Object[] fields = new Object[1 + permissions.length * 2];
        fields[0] = requestId;
        for (int k = 0; k < permissions.length; k++) {
            boolean granted = results == null ? check(permissions[k])
                : k < results.length && results[k] == PackageManager.PERMISSION_GRANTED;
            fields[1 + 2 * k] = permissions[k];
            fields[2 + 2 * k] = granted ? 1 : 0;
        }
        Druid.post("permission", fields);
    }
}
