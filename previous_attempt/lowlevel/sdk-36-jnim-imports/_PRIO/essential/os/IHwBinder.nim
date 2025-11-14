import jnim

jclass android.os.IHwBinder* of JVMObject:
  proc transact*(code: jint, request: HwParcel, reply: HwParcel, flags: jint)
  proc queryLocalInterface*(descriptor: string): IHwInterface
  proc linkToDeath*(recipient: DeathRecipient, cookie: jlong): jboolean
  proc unlinkToDeath*(recipient: DeathRecipient): jboolean

jclass android.os.IHwBinder.DeathRecipient* of JVMObject:
  proc serviceDied*(cookie: jlong)

jclass android.os.DeathRecipient* of JVMObject:
  proc serviceDied*(cookie: jlong)

