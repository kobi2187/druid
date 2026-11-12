package __PACKAGE__

import android.Manifest
import android.app.Application
import android.app.NativeActivity
import android.content.ComponentName
import android.content.Intent
import android.content.pm.PackageManager
import androidx.test.core.app.ApplicationProvider
import dev.druid.Druid
import dev.druid.DruidPermissionActivity
import dev.druid.Permissions
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config

/**
 * The app's Android side, without native code (Robolectric runs none): the
 * launcher opens MainActivity, which runs libmain.so; Druid's Activity is
 * merged in; and Druid can ask for permissions over MainActivity.
 */
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [36])
class AppTest {
    private val app: Application = ApplicationProvider.getApplicationContext()

    @Test fun launcherOpensMainActivityRunningLibmain() {
        val main = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(app.packageName)
        val found = app.packageManager.queryIntentActivities(main, 0)
        assertEquals(MainActivity::class.java.name, found.single().activityInfo.name)
        val info = app.packageManager.getActivityInfo(ComponentName(app, MainActivity::class.java), PackageManager.GET_META_DATA)
        assertEquals("main", info.metaData.getString("android.app.lib_name"))
        assertTrue(NativeActivity::class.java.isAssignableFrom(MainActivity::class.java))
    }

    @Test fun druidIsMergedIn() {
        app.packageManager.getActivityInfo(ComponentName(app, DruidPermissionActivity::class.java), 0)
        val perms = app.packageManager.getPackageInfo(app.packageName, PackageManager.GET_PERMISSIONS).requestedPermissions!!
        assertTrue(Manifest.permission.CAMERA in perms)
        assertTrue(Manifest.permission.VIBRATE in perms)
    }

    @Test fun druidAsksForPermissionsOverMainActivity() {
        val activity = Robolectric.buildActivity(MainActivity::class.java).get()   // attached; native code cannot load here
        Druid.init(activity)
        shadowOf(app).denyPermissions(Manifest.permission.CAMERA)
        Permissions.request(arrayOf(Manifest.permission.CAMERA), 1)
        val asked = shadowOf(activity).nextStartedActivity
        assertEquals(DruidPermissionActivity::class.java.name, asked.component!!.className)
    }
}
