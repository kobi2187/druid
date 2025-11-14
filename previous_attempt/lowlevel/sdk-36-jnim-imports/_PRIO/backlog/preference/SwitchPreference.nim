import jnim

jclass android.preference.SwitchPreference* of TwoStatePreference:
  proc setSwitchTextOn*(onText: CharSequence)
  proc setSwitchTextOff*(offText: CharSequence)
  proc setSwitchTextOn*(resId: jint)
  proc setSwitchTextOff*(resId: jint)
  proc getSwitchTextOn*(): CharSequence
  proc getSwitchTextOff*(): CharSequence

