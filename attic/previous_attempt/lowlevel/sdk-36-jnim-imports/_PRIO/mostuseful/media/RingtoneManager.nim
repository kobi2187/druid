import jnim

jclass android.media.RingtoneManager* of JVMObject:
  proc setType*(type: jint)
  proc inferStreamType*(): jint
  proc setStopPreviousRingtone*(stopPreviousRingtone: jboolean)
  proc getStopPreviousRingtone*(): jboolean
  proc stopPreviousRingtone*()
  proc getIncludeDrm*(): jboolean
  proc setIncludeDrm*(includeDrm: jboolean)
  proc getCursor*(): Cursor
  proc getRingtone*(position: jint): Ringtone
  proc getRingtoneUri*(position: jint): Uri
  proc getRingtoneUriForRestore*(contentResolver: ContentResolver, value: string, ringtoneType: jint): Uri {.`static`.}
  proc getRingtonePosition*(ringtoneUri: Uri): jint
  proc getValidRingtoneUri*(context: Context): Uri {.`static`.}
  proc getRingtone*(context: Context, ringtoneUri: Uri): Ringtone {.`static`.}
  proc getRingtone*(context: Context, ringtoneUri: Uri, volumeShaperConfig: VolumeShaper.Configuration): Ringtone {.`static`.}
  proc getRingtone*(context: Context, ringtoneUri: Uri, volumeShaperConfig: VolumeShaper.Configuration, createLocalMediaPlayer: jboolean): Ringtone {.`static`.}
  proc getRingtone*(context: Context, ringtoneUri: Uri, volumeShaperConfig: VolumeShaper.Configuration, audioAttributes: AudioAttributes): Ringtone {.`static`.}
  proc getActualDefaultRingtoneUri*(context: Context, type: jint): Uri {.`static`.}
  proc setActualDefaultRingtoneUri*(context: Context, type: jint, ringtoneUri: Uri) {.`static`.}
  proc addCustomExternalRingtone*(fileUri: Uri, type: jint): Uri
  proc getCacheForType*(type: jint): Uri {.`static`.}
  proc getCacheForType*(type: jint, userId: jint): Uri {.`static`.}
  proc isDefault*(ringtoneUri: Uri): jboolean {.`static`.}
  proc getDefaultType*(defaultRingtoneUri: Uri): jint {.`static`.}
  proc getDefaultUri*(type: jint): Uri {.`static`.}
  proc openDefaultRingtoneUri*(context: Context, uri: Uri): AssetFileDescriptor {.`static`.}
  proc hasHapticChannels*(position: jint): jboolean
  proc hasHapticChannels*(ringtoneUri: Uri): jboolean {.`static`.}
  proc hasHapticChannels*(context: Context, ringtoneUri: Uri): jboolean {.`static`.}
  proc ensureDefaultRingtones*(context: Context) {.`static`.}
  TYPE_RINGTONE*: jint {.`static`.}
  TYPE_NOTIFICATION*: jint {.`static`.}
  TYPE_ALARM*: jint {.`static`.}
  TYPE_ALL*: jint {.`static`.}
  ACTION_RINGTONE_PICKER*: string {.`static`.}
  EXTRA_RINGTONE_SHOW_DEFAULT*: string {.`static`.}
  EXTRA_RINGTONE_SHOW_SILENT*: string {.`static`.}
  EXTRA_RINGTONE_INCLUDE_DRM*: string {.`static`.}
  EXTRA_RINGTONE_EXISTING_URI*: string {.`static`.}
  EXTRA_RINGTONE_DEFAULT_URI*: string {.`static`.}
  EXTRA_RINGTONE_TYPE*: string {.`static`.}
  EXTRA_RINGTONE_TITLE*: string {.`static`.}
  EXTRA_RINGTONE_AUDIO_ATTRIBUTES_FLAGS*: string {.`static`.}
  EXTRA_RINGTONE_PICKED_URI*: string {.`static`.}
  ID_COLUMN_INDEX*: jint {.`static`.}
  TITLE_COLUMN_INDEX*: jint {.`static`.}
  URI_COLUMN_INDEX*: jint {.`static`.}

