import jnim

jclass android.content.ComponentName* of JVMObject:
  proc createRelative*(pkg: string, cls: string): ComponentName {.`static`.}
  proc createRelative*(pkg: Context, cls: string): ComponentName {.`static`.}
  proc clone*(): ComponentName
  proc getPackageName*(): string
  proc getClassName*(): string
  proc getShortClassName*(): string
  proc flattenToShortString*(componentName: ComponentName): string {.`static`.}
  proc flattenToString*(): string
  proc flattenToShortString*(): string
  proc appendShortString*(sb: StringBuilder)
  proc appendShortString*(sb: StringBuilder, packageName: string, className: string) {.`static`.}
  proc printShortString*(pw: PrintWriter, packageName: string, className: string) {.`static`.}
  proc unflattenFromString*(str: string): ComponentName {.`static`.}
  proc toShortString*(): string
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc compareTo*(that: ComponentName): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc writeToParcel*(c: ComponentName, output:Parcel) {.`static`.}
  proc readFromParcel*(in: Parcel): ComponentName {.`static`.}
  CREATOR*: Parcelable.Creator[ComponentName] {.`static`.}

