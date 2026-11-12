import jnim

jclass android.flags.FeatureFlags* of JVMObject:
  proc getInstance*(): FeatureFlags {.`static`.}
  proc setInstance*(instance: FeatureFlags) {.`static`.}
  proc booleanFlag*(namespace: string, name: string, def: jboolean): BooleanFlag {.`static`.}
  proc fusedOffFlag*(namespace: string, name: string): FusedOffFlag {.`static`.}
  proc fusedOnFlag*(namespace: string, name: string): FusedOnFlag {.`static`.}
  proc dynamicBooleanFlag*(namespace: string, name: string, def: jboolean): DynamicBooleanFlag {.`static`.}
  proc addChangeListener*(listener: ChangeListener)
  proc removeChangeListener*(listener: ChangeListener)
  proc isEnabled*(flag: BooleanFlag): jboolean
  proc isEnabled*(flag: FusedOffFlag): jboolean
  proc isEnabled*(flag: FusedOnFlag): jboolean
  proc isCurrentlyEnabled*(flag: DynamicBooleanFlag): jboolean
  proc sync*()

