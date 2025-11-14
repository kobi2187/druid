import jnim

jclass android.window.TaskFragmentCreationParams* of JVMObject:
  proc getOrganizer*(): TaskFragmentOrganizerToken
  proc getFragmentToken*(): IBinder
  proc getOwnerToken*(): IBinder
  proc getInitialRelativeBounds*(): Rect
  proc getWindowingMode*(): jint
  proc getPairedPrimaryFragmentToken*(): IBinder
  proc getPairedActivityToken*(): IBinder
  proc getAllowTransitionWhenEmpty*(): jboolean
  proc getOverrideOrientation*(): jint
  proc getConfigurationChangeMask*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc describeContents*(): jint
  CREATOR*: Creator[TaskFragmentCreationParams] {.`static`.}

jclass android.window.TaskFragmentCreationParams.Builder* of JVMObject:
  proc setInitialRelativeBounds*(bounds: Rect): Builder
  proc setWindowingMode*(windowingMode: jint): Builder
  proc setPairedPrimaryFragmentToken*(fragmentToken: IBinder): Builder
  proc setPairedActivityToken*(activityToken: IBinder): Builder
  proc setAllowTransitionWhenEmpty*(allowTransitionWhenEmpty: jboolean): Builder
  proc setOverrideOrientation*(overrideOrientation: jint): Builder
  proc setConfigurationChangeMask*(configurationChangeMask: jint): Builder
  proc build*(): TaskFragmentCreationParams

jclass android.window.Builder* of JVMObject:
  proc setInitialRelativeBounds*(bounds: Rect): Builder
  proc setWindowingMode*(windowingMode: jint): Builder
  proc setPairedPrimaryFragmentToken*(fragmentToken: IBinder): Builder
  proc setPairedActivityToken*(activityToken: IBinder): Builder
  proc setAllowTransitionWhenEmpty*(allowTransitionWhenEmpty: jboolean): Builder
  proc setOverrideOrientation*(overrideOrientation: jint): Builder
  proc setConfigurationChangeMask*(configurationChangeMask: jint): Builder
  proc build*(): TaskFragmentCreationParams

