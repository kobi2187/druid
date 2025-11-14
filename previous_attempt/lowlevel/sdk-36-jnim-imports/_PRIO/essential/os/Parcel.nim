import jnim

jclass android.os.Parcel* of JVMObject:
  proc obtain*(): Parcel {.`static`.}
  proc obtain*(binder: IBinder): Parcel {.`static`.}
  proc recycle*()
  proc setReadWriteHelper*(helper: ReadWriteHelper)
  proc hasReadWriteHelper*(): jboolean
  proc getGlobalAllocSize*(): jlong {.`static`.}
  proc getGlobalAllocCount*(): jlong {.`static`.}
  proc markSensitive*()
  proc isForRpc*(): jboolean
  proc getFlags*(): jint
  proc setFlags*(flags: jint)
  proc addFlags*(flags: jint)
  proc setPropagateAllowBlocking*()
  proc dataSize*(): jint
  proc dataAvail*(): jint
  proc dataPosition*(): jint
  proc dataCapacity*(): jint
  proc setDataSize*(size: jint)
  proc setDataPosition*(pos: jint)
  proc setDataCapacity*(size: jint)
  proc pushAllowFds*(allowFds: jboolean): jboolean
  proc restoreAllowFds*(lastValue: jboolean)
  proc marshall*(): seq[jbyte]
  proc marshall*(buffer: ByteBuffer)
  proc unmarshall*(data: seq[jbyte], offset: jint, length: jint)
  proc unmarshall*(buffer: ByteBuffer)
  proc appendFrom*(parcel: Parcel, offset: jint, length: jint)
  proc compareData*(other: Parcel): jint
  proc compareData*(a: Parcel, offsetA: jint, b: Parcel, offsetB: jint, length: jint): jboolean {.`static`.}
  proc setClassCookie*(clz: Class, cookie: JObject)
  proc getClassCookie*(clz: Class): JObject
  proc removeClassCookie*(clz: Class, expectedCookie: JObject)
  proc hasClassCookie*(clz: Class): jboolean
  proc adoptClassCookies*(from: Parcel)
  proc copyClassCookies*(): Map[Class, JObject]
  proc putClassCookies*(cookies: Map[Class, JObject])
  proc hasFileDescriptors*(): jboolean
  proc hasFileDescriptors*(offset: jint, length: jint): jboolean
  proc hasFileDescriptors*(value: JObject): jboolean {.`static`.}
  proc hasBinders*(): jboolean
  proc hasBinders*(offset: jint, length: jint): jboolean
  proc writeInterfaceToken*(interfaceName: string)
  proc enforceInterface*(interfaceName: string)
  proc enforceNoDataAvail*()
  proc replaceCallingWorkSourceUid*(workSourceUid: jint): jboolean
  proc readCallingWorkSourceUid*(): jint
  proc writeByteArray*(b: seq[jbyte])
  proc writeByteArray*(b: seq[jbyte], offset: jint, len: jint)
  proc writeBlob*(b: seq[jbyte])
  proc writeBlob*(b: seq[jbyte], offset: jint, len: jint)
  proc writeInt*(val: jint)
  proc writeLong*(val: jlong)
  proc writeFloat*(val: jfloat)
  proc writeDouble*(val: jdouble)
  proc writeString*(val: string)
  proc writeString8*(val: string)
  proc writeString16*(val: string)
  proc writeStringNoHelper*(val: string)
  proc writeString8NoHelper*(val: string)
  proc writeString16NoHelper*(val: string)
  proc writeBoolean*(val: jboolean)
  proc writeCharSequence*(val: CharSequence)
  proc writeStrongBinder*(val: IBinder)
  proc writeStrongInterface*(val: IInterface)
  proc writeFileDescriptor*(val: FileDescriptor)
  proc writeRawFileDescriptor*(val: FileDescriptor)
  proc writeRawFileDescriptorArray*(value: seq[FileDescriptor])
  proc writeByte*(val: jbyte)
  proc writeMap*(val: Map)
  proc writeArrayMap*(val: ArrayMap[string, JObject])
  proc writeTypedArrayMap*(val: ArrayMap[string, T], parcelableFlags: jint)
  proc writeArraySet*(val: ArraySet[? extends Object])
  proc writeBundle*(val: Bundle)
  proc writePersistableBundle*(val: PersistableBundle)
  proc writeSize*(val: Size)
  proc writeSizeF*(val: SizeF)
  proc writeList*(val: List)
  proc writeArray*(val: seq[JObject])
  proc writeSparseArray*(val: SparseArray[T])
  proc writeSparseBooleanArray*(val: SparseBooleanArray)
  proc writeSparseIntArray*(val: SparseIntArray)
  proc writeBooleanArray*(val: seq[jboolean])
  proc createBooleanArray*(): seq[jboolean]
  proc readBooleanArray*(val: seq[jboolean])
  proc writeShortArray*(val: seq[jshort])
  proc createShortArray*(): seq[jshort]
  proc readShortArray*(val: seq[jshort])
  proc writeCharArray*(val: seq[jchar])
  proc createCharArray*(): seq[jchar]
  proc readCharArray*(val: seq[jchar])
  proc writeIntArray*(val: seq[jint])
  proc createIntArray*(): seq[jint]
  proc readIntArray*(val: seq[jint])
  proc writeLongArray*(val: seq[jlong])
  proc createLongArray*(): seq[jlong]
  proc readLongArray*(val: seq[jlong])
  proc writeFloatArray*(val: seq[jfloat])
  proc createFloatArray*(): seq[jfloat]
  proc readFloatArray*(val: seq[jfloat])
  proc writeDoubleArray*(val: seq[jdouble])
  proc createDoubleArray*(): seq[jdouble]
  proc readDoubleArray*(val: seq[jdouble])
  proc writeStringArray*(val: seq[string])
  proc createStringArray*(): seq[string]
  proc readStringArray*(val: seq[string])
  proc writeString8Array*(val: seq[string])
  proc createString8Array*(): seq[string]
  proc readString8Array*(val: seq[string])
  proc writeString16Array*(val: seq[string])
  proc createString16Array*(): seq[string]
  proc readString16Array*(val: seq[string])
  proc writeBinderArray*(val: seq[IBinder])
  proc writeInterfaceArray*(val: seq[T])
  proc writeCharSequenceArray*(val: seq[CharSequence])
  proc writeCharSequenceList*(val: ArrayList[CharSequence])
  proc createBinderArray*(): seq[IBinder]
  proc readBinderArray*(val: seq[IBinder])
  proc createInterfaceArray*(newArray: IntFunction[seq[T]], asInterface: Function[IBinder, T]): seq[T]
  proc readInterfaceArray*(val: seq[T], asInterface: Function[IBinder, T])
  proc writeTypedList*(val: List[T])
  proc writeTypedSparseArray*(val: SparseArray[T], parcelableFlags: jint)
  proc writeTypedList*(val: List[T], parcelableFlags: jint)
  proc writeStringList*(val: List[string])
  proc writeBinderList*(val: List[IBinder])
  proc writeInterfaceList*(val: List[T])
  proc writeParcelableList*(val: List[T], flags: jint)
  proc writeTypedArray*(val: seq[T], parcelableFlags: jint)
  proc writeTypedObject*(val: T, parcelableFlags: jint)
  proc writeFixedArray*(val: T, parcelableFlags: jint, dimensions: jint)
  proc writeValue*(v: JObject)
  proc getValueType*(v: JObject): jint {.`static`.}
  proc writeValue*(type: jint, v: JObject)
  proc writeParcelable*(p: Parcelable, parcelableFlags: jint)
  proc writeParcelableCreator*(p: Parcelable)
  proc allowSquashing*(): jboolean
  proc restoreAllowSquashing*(previous: jboolean)
  proc maybeWriteSquashed*(p: Parcelable): jboolean
  proc readSquashed*(reader: SquashReadHelper[T]): T
  proc writeSerializable*(s: Serializable)
  proc setStackTraceParceling*(enabled: jboolean) {.`static`.}
  proc writeException*(e: Exception)
  proc getExceptionCode*(e: Throwable): jint {.`static`.}
  proc writeStackTrace*(e: Throwable)
  proc writeNoException*()
  proc readException*()
  proc readExceptionCode*(): jint
  proc readException*(code: jint, msg: string)
  proc createExceptionOrNull*(code: jint, msg: string): Exception
  proc readInt*(): jint
  proc readLong*(): jlong
  proc readFloat*(): jfloat
  proc readDouble*(): jdouble
  proc readString*(): string
  proc readString8*(): string
  proc readString16*(): string
  proc readStringNoHelper*(): string
  proc readString8NoHelper*(): string
  proc readString16NoHelper*(): string
  proc readBoolean*(): jboolean
  proc readCharSequence*(): CharSequence
  proc readStrongBinder*(): IBinder
  proc readFileDescriptor*(): ParcelFileDescriptor
  proc readRawFileDescriptor*(): FileDescriptor
  proc createRawFileDescriptorArray*(): seq[FileDescriptor]
  proc readRawFileDescriptorArray*(val: seq[FileDescriptor])
  proc readByte*(): jbyte
  proc readMap*(outVal: Map, loader: ClassLoader)
  proc readMap*(outVal: Map[? super K, ? super V], loader: ClassLoader, clazzKey: Class[K], clazzValue: Class[V])
  proc readList*(outVal: List, loader: ClassLoader)
  proc readList*(outVal: List[? super T], loader: ClassLoader, clazz: Class[T])
  proc readHashMap*(loader: ClassLoader): HashMap
  proc readHashMap*(loader: ClassLoader, clazzKey: Class[? extends K], clazzValue: Class[? extends V]): HashMap[K, V]
  proc readBundle*(): Bundle
  proc readBundle*(loader: ClassLoader): Bundle
  proc readPersistableBundle*(): PersistableBundle
  proc readPersistableBundle*(loader: ClassLoader): PersistableBundle
  proc readSize*(): Size
  proc readSizeF*(): SizeF
  proc createByteArray*(): seq[jbyte]
  proc readByteArray*(val: seq[jbyte])
  proc readBlob*(): seq[jbyte]
  proc readStringArray*(): seq[string]
  proc readCharSequenceArray*(): seq[CharSequence]
  proc readCharSequenceList*(): ArrayList[CharSequence]
  proc readArrayList*(loader: ClassLoader): ArrayList
  proc readArrayList*(loader: ClassLoader, clazz: Class[? extends T]): ArrayList[T]
  proc readArray*(loader: ClassLoader): seq[JObject]
  proc readArray*(loader: ClassLoader, clazz: Class[T]): seq[T]
  proc readSparseArray*(loader: ClassLoader): SparseArray[T]
  proc readSparseArray*(loader: ClassLoader, clazz: Class[? extends T]): SparseArray[T]
  proc readSparseBooleanArray*(): SparseBooleanArray
  proc readSparseIntArray*(): SparseIntArray
  proc createTypedArrayList*(c: Parcelable.Creator[T]): ArrayList[T]
  proc readTypedList*(list: List[T], c: Parcelable.Creator[T])
  proc createTypedSparseArray*(creator: Parcelable.Creator[T]): SparseArray[T]
  proc createTypedArrayMap*(creator: Parcelable.Creator[T]): ArrayMap[string, T]
  proc createStringArrayList*(): ArrayList[string]
  proc createBinderArrayList*(): ArrayList[IBinder]
  proc createInterfaceArrayList*(asInterface: Function[IBinder, T]): ArrayList[T]
  proc readStringList*(list: List[string])
  proc readBinderList*(list: List[IBinder])
  proc readInterfaceList*(list: List[T], asInterface: Function[IBinder, T])
  proc readParcelableList*(list: List[T], cl: ClassLoader): List[T]
  proc readParcelableList*(list: List[T], cl: ClassLoader, clazz: Class[? extends T]): List[T]
  proc createTypedArray*(c: Parcelable.Creator[T]): seq[T]
  proc readTypedArray*(val: seq[T], c: Parcelable.Creator[T])
  proc readTypedArray*(c: Parcelable.Creator[T]): seq[T]
  proc readTypedObject*(c: Parcelable.Creator[T]): T
  proc readFixedArray*(val: T)
  proc readFixedArray*(val: T, asInterface: Function[IBinder, S])
  proc readFixedArray*(val: T, c: Parcelable.Creator[S])
  proc createFixedArray*(cls: Class[T], dimensions: jint): T
  proc createFixedArray*(cls: Class[T], asInterface: Function[IBinder, S], dimensions: jint): T
  proc createFixedArray*(cls: Class[T], c: Parcelable.Creator[S], dimensions: jint): T
  proc writeParcelableArray*(value: seq[T], parcelableFlags: jint)
  proc readValue*(loader: ClassLoader): JObject
  proc readParcelable*(loader: ClassLoader): T
  proc readParcelable*(loader: ClassLoader, clazz: Class[T]): T
  proc readCreator*(creator: Parcelable.Creator[?], loader: ClassLoader): T
  proc readParcelableCreator*(loader: ClassLoader): Parcelable.Creator[?]
  proc readParcelableCreator*(loader: ClassLoader, clazz: Class[T]): Parcelable.Creator[T]
  proc readParcelableArray*(loader: ClassLoader): seq[Parcelable]
  proc readParcelableArray*(loader: ClassLoader, clazz: Class[T]): seq[T]
  proc readSerializable*(): Serializable
  proc readSerializable*(loader: ClassLoader, clazz: Class[T]): T
  proc readArrayMap*(outVal: ArrayMap[? super String, JObject], loaderProvider: ClassLoaderProvider)
  proc readArraySet*(loader: ClassLoader): ArraySet[? extends Object]
  proc getOpenAshmemSize*(): jlong
  FLAG_IS_REPLY_FROM_BLOCKING_ALLOWED_OBJECT*: jint {.`static`.}
  FLAG_PROPAGATE_ALLOW_BLOCKING*: jint {.`static`.}
  EX_HAS_NOTED_APPOPS_REPLY_HEADER*: jint {.`static`.}
  STRING_CREATOR*: Parcelable.Creator[string] {.`static`.}

jclass android.os.Parcel.ReadWriteHelper* of JVMObject:
  proc writeString8*(p: Parcel, s: string)
  proc writeString16*(p: Parcel, s: string)
  proc readString8*(p: Parcel): string
  proc readString16*(p: Parcel): string

jclass android.os.ReadWriteHelper* of JVMObject:
  proc writeString8*(p: Parcel, s: string)
  proc writeString16*(p: Parcel, s: string)
  proc readString8*(p: Parcel): string
  proc readString16*(p: Parcel): string
  DEFAULT*: ReadWriteHelper {.`static`.}


