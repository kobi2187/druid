import jnim

jclass android.provider.OemMetadataService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onGetSupportedMimeTypes*(): Set[string]
  proc onGetOemCustomData*(fd: ParcelFileDescriptor): Map[string, string]
  SERVICE_INTERFACE*: string {.`static`.}
  EXTRA_OEM_SUPPORTED_MIME_TYPES*: string {.`static`.}
  EXTRA_OEM_DATA_KEYS*: string {.`static`.}
  EXTRA_OEM_DATA_VALUES*: string {.`static`.}
  BIND_OEM_METADATA_SERVICE_PERMISSION*: string {.`static`.}

