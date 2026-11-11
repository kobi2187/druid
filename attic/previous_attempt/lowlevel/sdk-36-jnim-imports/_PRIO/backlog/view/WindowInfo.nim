import jnim

jclass android.view.WindowInfo* of JVMObject:
  proc obtain*(): WindowInfo {.`static`.}
  proc obtain*(other: WindowInfo): WindowInfo {.`static`.}
  proc recycle*()
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  typ*: jint
  layer*: jint
  token*: IBinder
  parentToken*: IBinder
  activityToken*: IBinder
  focused*: jboolean
  regionInScreen*: Region
  childTokens*: List[IBinder]
  title*: CharSequence
  accessibilityIdOfAnchor*: jlong
  inPictureInPicture*: jboolean
  hasFlagWatchOutsideTouch*: jboolean
  displayId*: jint
  taskId*: jint
  mTransformMatrix*: jfloat
  mMagnificationSpec*: MagnificationSpec
  locales*: LocaleList
  CREATOR*: Parcelable.Creator[WindowInfo] {.`static`.}

