package __PACKAGE__

import dev.rui.android.RuiActivity

/**
 * The app's Activity: RUI's RuiActivity (a NativeActivity running libmain.so,
 * i.e. app.nim). Druid needs nothing here -- `attachDruid` in app.nim starts it
 * with this Activity. Override lifecycle methods or pass Intent extras (read in
 * Nim with `intentExtra`) as the app needs.
 */
class MainActivity : RuiActivity()
