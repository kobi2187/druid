import jnim

jclass android.accessibilityservice.GestureDescription* of JVMObject:
  proc getMaxStrokeCount*(): jint {.`static`.}
  proc getMaxGestureDuration*(): jlong {.`static`.}
  proc getStrokeCount*(): jint
  proc getStroke*(index: jint): StrokeDescription
  proc getDisplayId*(): jint

jclass android.accessibilityservice.GestureDescription.Builder* of JVMObject:
  proc addStroke*(strokeDescription: StrokeDescription): Builder
  proc setDisplayId*(displayId: jint): Builder
  proc build*(): GestureDescription

jclass android.accessibilityservice.GestureDescription.StrokeDescription* of JVMObject:
  proc getPath*(): Path
  proc getStartTime*(): jlong
  proc getDuration*(): jlong
  proc getId*(): jint
  proc continueStroke*(path: Path, startTime: jlong, duration: jlong, willContinue: jboolean): StrokeDescription
  proc willContinue*(): jboolean
  proc getContinuedStrokeId*(): jint

jclass android.accessibilityservice.GestureDescription.TouchPoint* of JVMObject:
  proc copyFrom*(other: TouchPoint)
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.accessibilityservice.GestureDescription.GestureStep* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.accessibilityservice.GestureDescription.MotionEventGenerator* of JVMObject:
  proc getGestureStepsFromGestureDescription*(description: GestureDescription, sampleTimeMs: jint): List[GestureStep] {.`static`.}

jclass android.accessibilityservice.Builder* of JVMObject:
  proc addStroke*(strokeDescription: StrokeDescription): Builder
  proc setDisplayId*(displayId: jint): Builder
  proc build*(): GestureDescription

jclass android.accessibilityservice.StrokeDescription* of JVMObject:
  proc getPath*(): Path
  proc getStartTime*(): jlong
  proc getDuration*(): jlong
  proc getId*(): jint
  proc continueStroke*(path: Path, startTime: jlong, duration: jlong, willContinue: jboolean): StrokeDescription
  proc willContinue*(): jboolean
  proc getContinuedStrokeId*(): jint

jclass android.accessibilityservice.TouchPoint* of JVMObject:
  proc copyFrom*(other: TouchPoint)
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  mStrokeId*: jint
  mContinuedStrokeId*: jint
  mIsStartOfPath*: jboolean
  mIsEndOfPath*: jboolean
  mX*: jfloat
  mY*: jfloat
  CREATOR*: Parcelable.Creator[TouchPoint] {.`static`.}

jclass android.accessibilityservice.GestureStep* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  timeSinceGestureStart*: jlong
  numTouchPoints*: jint
  touchPoints*: TouchPoint
  CREATOR*: Parcelable.Creator[GestureStep] {.`static`.}

jclass android.accessibilityservice.MotionEventGenerator* of JVMObject:
  proc getGestureStepsFromGestureDescription*(description: GestureDescription, sampleTimeMs: jint): List[GestureStep] {.`static`.}

