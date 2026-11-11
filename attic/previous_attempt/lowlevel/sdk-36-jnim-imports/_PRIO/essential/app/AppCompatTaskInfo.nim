import jnim

jclass android.app.AppCompatTaskInfo* of JVMObject:
  proc describeContents*(): jint
  proc hasCompatUI*(): jboolean
  proc isTopActivityPillarboxShaped*(): jboolean
  proc isLetterboxEducationEnabled*(): jboolean
  proc setLetterboxEducationEnabled*(enable: jboolean)
  proc eligibleForLetterboxEducation*(): jboolean
  proc setEligibleForLetterboxEducation*(enable: jboolean)
  proc eligibleForUserAspectRatioButton*(): jboolean
  proc setEligibleForUserAspectRatioButton*(enable: jboolean)
  proc isLetterboxDoubleTapEnabled*(): jboolean
  proc setLetterboxDoubleTapEnabled*(enable: jboolean)
  proc isFromLetterboxDoubleTap*(): jboolean
  proc setIsFromLetterboxDoubleTap*(enable: jboolean)
  proc isUserFullscreenOverrideEnabled*(): jboolean
  proc setUserFullscreenOverrideEnabled*(enable: jboolean)
  proc isSystemFullscreenOverrideEnabled*(): jboolean
  proc setSystemFullscreenOverrideEnabled*(enable: jboolean)
  proc isTopActivityInSizeCompat*(): jboolean
  proc setTopActivityInSizeCompat*(enable: jboolean)
  proc isRestartMenuEnabledForDisplayMove*(): jboolean
  proc setRestartMenuEnabledForDisplayMove*(enable: jboolean)
  proc isTopActivityLetterboxed*(): jboolean
  proc setTopActivityLetterboxed*(enable: jboolean)
  proc hasMinAspectRatioOverride*(): jboolean
  proc setHasMinAspectRatioOverride*(enable: jboolean)
  proc setOptOutEdgeToEdge*(enable: jboolean)
  proc hasOptOutEdgeToEdge*(): jboolean
  proc clearTopActivityFlags*()
  proc equalsForTaskOrganizer*(that: AppCompatTaskInfo): jboolean
  proc equalsForCompatUi*(that: AppCompatTaskInfo): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  topActivityLetterboxVerticalPosition*: jint
  topActivityLetterboxHorizontalPosition*: jint
  topActivityLetterboxWidth*: jint
  topActivityLetterboxHeight*: jint
  topActivityAppBounds*: Rect
  topActivityLetterboxBounds*: Rect
  cameraCompatTaskInfo*: CameraCompatTaskInfo
  FLAG_HAS_MIN_ASPECT_RATIO_OVERRIDE*: jint {.`static`.}
  FLAG_OPT_OUT_EDGE_TO_EDGE*: jint {.`static`.}
  CREATOR*: Creator[AppCompatTaskInfo] {.`static`.}

