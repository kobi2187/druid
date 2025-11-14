import jnim

jclass android.media.MediaRouter2Utils* of JVMObject:
  proc toUniqueId*(providerId: string, id: string): string {.`static`.}
  proc getProviderId*(uniqueId: string): string {.`static`.}
  proc getOriginalId*(uniqueId: string): string {.`static`.}

