import jnim

jclass java.lang.IO* of JVMObject:
  proc println*(obj: JObject) {.`static`.}
  proc println*() {.`static`.}
  proc print*(obj: JObject) {.`static`.}
  proc readln*(): string {.`static`.}
  proc readln*(prompt: string): string {.`static`.}

