import jnim

jclass android.os.HwRemoteBinder* of JVMObject:
  proc queryLocalInterface*(descriptor: string): IHwInterface
  proc transact*(code: jint, request: HwParcel, reply: HwParcel, flags: jint)
  proc linkToDeath*(recipient: DeathRecipient, cookie: jlong): jboolean
  proc unlinkToDeath*(recipient: DeathRecipient): jboolean
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint

