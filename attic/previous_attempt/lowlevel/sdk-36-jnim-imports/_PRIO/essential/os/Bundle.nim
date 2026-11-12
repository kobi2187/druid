import jnim

jclass android.os.Bundle* of BaseBundle:
  proc forPair*(key: string, value: string): Bundle {.`static`.}
  proc setClassLoader*(loader: ClassLoader)
  proc getClassLoader*(): ClassLoader
  proc setAllowFds*(allowFds: jboolean): jboolean
  proc enableTokenVerification*()
  proc setDefusable*(defusable: jboolean)
  proc setDefusable*(bundle: Bundle, defusable: jboolean): Bundle {.`static`.}
  proc clone*(): JObject
  proc deepCopy*(): Bundle
  proc clear*()
  proc remove*(key: string)
  proc putAll*(bundle: Bundle)
  proc getSize*(): jint
  proc hasFileDescriptors*(): jboolean
  proc hasBinders*(): jint
  proc hasIntent*(): jboolean
  proc putObject*(key: string, value: JObject)
  proc putByte*(key: string, value: jbyte)
  proc putChar*(key: string, value: jchar)
  proc putShort*(key: string, value: jshort)
  proc putFloat*(key: string, value: jfloat)
  proc putCharSequence*(key: string, value: CharSequence)
  proc putParcelable*(key: string, value: Parcelable)
  proc putSize*(key: string, value: Size)
  proc putSizeF*(key: string, value: SizeF)
  proc putParcelableArray*(key: string, value: seq[Parcelable])
  proc putParcelableArrayList*(key: string, value: ArrayList[? extends Parcelable])
  proc putParcelableList*(key: string, value: List[? extends Parcelable])
  proc putSparseParcelableArray*(key: string, value: SparseArray[? extends Parcelable])
  proc putIntegerArrayList*(key: string, value: ArrayList[Integer])
  proc putStringArrayList*(key: string, value: ArrayList[string])
  proc putCharSequenceArrayList*(key: string, value: ArrayList[CharSequence])
  proc putSerializable*(key: string, value: Serializable)
  proc putByteArray*(key: string, value: seq[jbyte])
  proc putShortArray*(key: string, value: seq[jshort])
  proc putCharArray*(key: string, value: seq[jchar])
  proc putFloatArray*(key: string, value: seq[jfloat])
  proc putCharSequenceArray*(key: string, value: seq[CharSequence])
  proc putBundle*(key: string, value: Bundle)
  proc putBinder*(key: string, value: IBinder)
  proc putIBinder*(key: string, value: IBinder)
  proc getByte*(key: string): jbyte
  proc getByte*(key: string, defaultValue: jbyte): Byte
  proc getChar*(key: string): jchar
  proc getChar*(key: string, defaultValue: jchar): jchar
  proc getShort*(key: string): jshort
  proc getShort*(key: string, defaultValue: jshort): jshort
  proc getFloat*(key: string): jfloat
  proc getFloat*(key: string, defaultValue: jfloat): jfloat
  proc getCharSequence*(key: string): CharSequence
  proc getCharSequence*(key: string, defaultValue: CharSequence): CharSequence
  proc getSize*(key: string): Size
  proc getSizeF*(key: string): SizeF
  proc getBundle*(key: string): Bundle
  proc getParcelable*(key: string): T
  proc getParcelable*(key: string, clazz: Class[T]): T
  proc getParcelableArray*(key: string): seq[Parcelable]
  proc getParcelableArray*(key: string, clazz: Class[T]): seq[T]
  proc getParcelableArrayList*(key: string): ArrayList[T]
  proc getParcelableArrayList*(key: string, clazz: Class[? extends T]): ArrayList[T]
  proc getSparseParcelableArray*(key: string): SparseArray[T]
  proc getSparseParcelableArray*(key: string, clazz: Class[? extends T]): SparseArray[T]
  proc getSerializable*(key: string): Serializable
  proc getSerializable*(key: string, clazz: Class[T]): T
  proc getIntegerArrayList*(key: string): ArrayList[Integer]
  proc getStringArrayList*(key: string): ArrayList[string]
  proc getCharSequenceArrayList*(key: string): ArrayList[CharSequence]
  proc getByteArray*(key: string): seq[jbyte]
  proc getShortArray*(key: string): seq[jshort]
  proc getCharArray*(key: string): seq[jchar]
  proc getFloatArray*(key: string): seq[jfloat]
  proc getCharSequenceArray*(key: string): seq[CharSequence]
  proc getBinder*(key: string): IBinder
  proc getIBinder*(key: string): IBinder
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc readFromParcel*(parcel: Parcel)
  proc toString*(): string
  proc toShortString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  STATUS_BINDERS_NOT_PRESENT*: jint {.`static`.}
  STATUS_BINDERS_PRESENT*: jint {.`static`.}
  STATUS_BINDERS_UNKNOWN*: jint {.`static`.}
  EMPTY*: Bundle {.`static`.}
  intentClass*: Class[?] {.`static`.}
  STRIPPED*: Bundle {.`static`.}
  CREATOR*: Parcelable.Creator[Bundle] {.`static`.}

