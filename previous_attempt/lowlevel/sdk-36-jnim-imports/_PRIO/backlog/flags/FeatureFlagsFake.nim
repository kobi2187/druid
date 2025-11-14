import jnim

jclass android.flags.FeatureFlagsFake* of FeatureFlags:
  proc isEnabled*(flag: BooleanFlag): jboolean
  proc isEnabled*(flag: FusedOffFlag): jboolean
  proc isEnabled*(flag: FusedOnFlag): jboolean
  proc isCurrentlyEnabled*(flag: DynamicBooleanFlag): jboolean
  proc setFlagValue*(flag: BooleanFlagBase, value: jboolean)

