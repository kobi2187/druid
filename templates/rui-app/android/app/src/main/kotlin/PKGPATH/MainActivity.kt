package __PACKAGE__

import android.content.Intent
import dev.druid.Druid
import dev.rui.android.RuiActivity

/**
 * The app's Activity: RUI's RuiActivity (a NativeActivity running libmain.so,
 * i.e. app.nim). `attachDruid` in app.nim starts Druid with this Activity, and
 * Druid reads what it was started with: a notification tap, a share, a link
 * (ekNotification / ekIncoming events). Override lifecycle methods or pass
 * Intent extras (read in Nim with `intentExtra`) as the app needs.
 */
class MainActivity : RuiActivity() {
    /** The app was already running (launchMode singleTask): pass the new Intent to Druid. */
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        Druid.newIntent(this, intent)
    }
}
