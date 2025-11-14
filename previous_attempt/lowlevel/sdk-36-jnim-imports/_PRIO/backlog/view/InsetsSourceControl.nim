import jnim

jclass android.view.InsetsSourceControl* of JVMObject:
  proc getId*(): jint
  proc getType*(): jint
  proc getLeash*(): SurfaceControl
  proc isInitiallyVisible*(): jboolean
  proc setSurfacePosition*(left: jint, top: jint): jboolean
  proc getSurfacePosition*(): Point
  proc setInsetsHint*(insets: Insets)
  proc setInsetsHint*(left: jint, top: jint, right: jint, bottom: jint)
  proc getInsetsHint*(): Insets
  proc isFake*(): jboolean
  proc setSkipAnimationOnce*(skipAnimation: jboolean)
  proc getAndClearSkipAnimationOnce*(): jboolean
  proc getImeStatsToken*(): ImeTracker.Token
  proc setImeStatsToken*(imeStatsToken: ImeTracker.Token)
  proc setParcelableFlags*(parcelableFlags: jint)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc release*(surfaceReleaseConsumer: Consumer[SurfaceControl])
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc dump*(prefix: string, pw: PrintWriter)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  CREATOR*: Creator[InsetsSourceControl] {.`static`.}

jclass android.view.InsetsSourceControl.Array* of JVMObject:
  proc getSeq*(): jint
  proc setSeq*(seq: jint)
  proc setTo*(other: Array, copyControls: jboolean)
  proc set*(controls: seq[InsetsSourceControl], copyControls: jboolean)
  proc get*(): seq[InsetsSourceControl]
  proc release*()
  proc setParcelableFlags*(parcelableFlags: jint)
  proc describeContents*(): jint
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.view.Array* of JVMObject:
  proc getSeq*(): jint
  proc setSeq*(seq: jint)
  proc setTo*(other: Array, copyControls: jboolean)
  proc set*(controls: seq[InsetsSourceControl], copyControls: jboolean)
  proc get*(): seq[InsetsSourceControl]
  proc release*()
  proc setParcelableFlags*(parcelableFlags: jint)
  proc describeContents*(): jint
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[Array] {.`static`.}

