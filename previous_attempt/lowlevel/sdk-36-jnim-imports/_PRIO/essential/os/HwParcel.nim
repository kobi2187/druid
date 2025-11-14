import jnim

jclass android.os.HwParcel* of JVMObject:
  proc writeInterfaceToken*(interfaceName: string)
  proc writeBool*(val: jboolean)
  proc writeInt8*(val: jbyte)
  proc writeInt16*(val: jshort)
  proc writeInt32*(val: jint)
  proc writeInt64*(val: jlong)
  proc writeFloat*(val: jfloat)
  proc writeDouble*(val: jdouble)
  proc writeString*(val: string)
  proc writeNativeHandle*(val: NativeHandle)
  proc writeBoolVector*(val: ArrayList[Boolean])
  proc writeInt8Vector*(val: ArrayList[Byte])
  proc writeInt16Vector*(val: ArrayList[Short])
  proc writeInt32Vector*(val: ArrayList[Integer])
  proc writeInt64Vector*(val: ArrayList[Long])
  proc writeFloatVector*(val: ArrayList[Float])
  proc writeDoubleVector*(val: ArrayList[Double])
  proc writeStringVector*(val: ArrayList[string])
  proc writeNativeHandleVector*(val: ArrayList[NativeHandle])
  proc writeStrongBinder*(binder: IHwBinder)
  proc writeHidlMemory*(memory: HidlMemory)
  proc enforceInterface*(interfaceName: string)
  proc readBool*(): jboolean
  proc readInt8*(): jbyte
  proc readInt16*(): jshort
  proc readInt32*(): jint
  proc readInt64*(): jlong
  proc readFloat*(): jfloat
  proc readDouble*(): jdouble
  proc readString*(): string
  proc readNativeHandle*(): NativeHandle
  proc readEmbeddedNativeHandle*(parentHandle: jlong, offset: jlong): NativeHandle
  proc readBoolVector*(): ArrayList[Boolean]
  proc readInt8Vector*(): ArrayList[Byte]
  proc readInt16Vector*(): ArrayList[Short]
  proc readInt32Vector*(): ArrayList[Integer]
  proc readInt64Vector*(): ArrayList[Long]
  proc readFloatVector*(): ArrayList[Float]
  proc readDoubleVector*(): ArrayList[Double]
  proc readStringVector*(): ArrayList[string]
  proc readNativeHandleVector*(): ArrayList[NativeHandle]
  proc readStrongBinder*(): IHwBinder
  proc readHidlMemory*(): HidlMemory
  proc readEmbeddedHidlMemory*(fieldHandle: jlong, parentHandle: jlong, offset: jlong): HidlMemory
  proc readBuffer*(expectedSize: jlong): HwBlob
  proc readEmbeddedBuffer*(expectedSize: jlong, parentHandle: jlong, offset: jlong, nullable: jboolean): HwBlob
  proc writeBuffer*(blob: HwBlob)
  proc writeStatus*(status: jint)
  proc verifySuccess*()
  proc releaseTemporaryStorage*()
  proc release*()
  proc send*()
  STATUS_SUCCESS*: jint {.`static`.}

