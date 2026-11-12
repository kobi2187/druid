import jnim

jclass android.os.IncidentReportArgs* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  proc toString*(): string
  proc setAll*(all: jboolean)
  proc setPrivacyPolicy*(privacyPolicy: jint)
  proc addSection*(section: jint)
  proc isAll*(): jboolean
  proc containsSection*(section: jint): jboolean
  proc sectionCount*(): jint
  proc addHeader*(header: seq[jbyte])
  CREATOR*: Parcelable.Creator[IncidentReportArgs] {.`static`.}

