import jnim

jclass android.media.ApplicationMediaCapabilities* of JVMObject:
  proc isVideoMimeTypeSupported*(videoMime: string): jboolean
  proc isHdrTypeSupported*(hdrType: string): jboolean
  proc isFormatSpecified*(format: string): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc getSupportedVideoMimeTypes*(): List[string]
  proc getUnsupportedVideoMimeTypes*(): List[string]
  proc getSupportedHdrTypes*(): List[string]
  proc getUnsupportedHdrTypes*(): List[string]
  proc isSlowMotionSupported*(): jboolean
  proc createFromXml*(xmlParser: XmlPullParser): ApplicationMediaCapabilities {.`static`.}
  CREATOR*: Creator[ApplicationMediaCapabilities] {.`static`.}

jclass android.media.ApplicationMediaCapabilities.Builder* of JVMObject:
  proc build*(): ApplicationMediaCapabilities
  proc addSupportedVideoMimeType*(codecMime: string): Builder
  proc addUnsupportedVideoMimeType*(codecMime: string): Builder
  proc addSupportedHdrType*(hdrType: string): Builder
  proc addUnsupportedHdrType*(hdrType: string): Builder
  proc setSlowMotionSupported*(slowMotionSupported: jboolean): Builder

jclass android.media.Builder* of JVMObject:
  proc build*(): ApplicationMediaCapabilities
  proc addSupportedVideoMimeType*(codecMime: string): Builder
  proc addUnsupportedVideoMimeType*(codecMime: string): Builder
  proc addSupportedHdrType*(hdrType: string): Builder
  proc addUnsupportedHdrType*(hdrType: string): Builder
  proc setSlowMotionSupported*(slowMotionSupported: jboolean): Builder

