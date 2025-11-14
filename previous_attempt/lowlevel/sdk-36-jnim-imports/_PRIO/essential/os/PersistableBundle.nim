import jnim

jclass android.os.PersistableBundle* of BaseBundle:
  proc isValidType*(value: JObject): jboolean {.`static`.}
  proc forPair*(key: string, value: string): PersistableBundle {.`static`.}
  proc clone*(): JObject
  proc deepCopy*(): PersistableBundle
  proc putPersistableBundle*(key: string, value: PersistableBundle)
  proc getPersistableBundle*(key: string): PersistableBundle
  proc writeUnknownObject*(v: JObject, name: string, output:TypedXmlSerializer)
  proc saveToXml*(output:XmlSerializer)
  proc saveToXml*(output:TypedXmlSerializer)
  proc isBundleContentsWithinLengthLimit*(limit: jint): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc restoreFromXml*(in: XmlPullParser): PersistableBundle {.`static`.}
  proc restoreFromXml*(in: TypedXmlPullParser): PersistableBundle {.`static`.}
  proc toString*(): string
  proc toShortString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc writeToStream*(outputStream: OutputStream)
  proc readFromStream*(inputStream: InputStream): PersistableBundle {.`static`.}
  EMPTY*: PersistableBundle {.`static`.}
  CREATOR*: Parcelable.Creator[PersistableBundle] {.`static`.}

