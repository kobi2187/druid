import jnim

jclass android.media.MediaFile* of JVMObject:
  proc isAudioFileType*(fileType: jint): jboolean {.`static`.}
  proc isVideoFileType*(fileType: jint): jboolean {.`static`.}
  proc isImageFileType*(fileType: jint): jboolean {.`static`.}
  proc isPlayListFileType*(fileType: jint): jboolean {.`static`.}
  proc isDrmFileType*(fileType: jint): jboolean {.`static`.}
  proc getFileType*(path: string): MediaFileType {.`static`.}
  proc isDocumentMimeType*(mimeType: string): jboolean {.`static`.}
  proc isExifMimeType*(mimeType: string): jboolean {.`static`.}
  proc isAudioMimeType*(mimeType: string): jboolean {.`static`.}
  proc isVideoMimeType*(mimeType: string): jboolean {.`static`.}
  proc isImageMimeType*(mimeType: string): jboolean {.`static`.}
  proc isPlayListMimeType*(mimeType: string): jboolean {.`static`.}
  proc isDrmMimeType*(mimeType: string): jboolean {.`static`.}
  proc getFileTitle*(path: string): string {.`static`.}
  proc getFileExtension*(path: string): string {.`static`.}
  proc getFileTypeForMimeType*(mimeType: string): jint {.`static`.}
  proc getMimeType*(path: string, formatCode: jint): string {.`static`.}
  proc getMimeTypeForFile*(path: string): string {.`static`.}
  proc getMimeTypeForFormatCode*(formatCode: jint): string {.`static`.}
  proc getFormatCode*(path: string, mimeType: string): jint {.`static`.}
  proc getFormatCodeForFile*(path: string): jint {.`static`.}
  proc getFormatCodeForMimeType*(mimeType: string): jint {.`static`.}

jclass android.media.MediaFileType* of JVMObject:
  fileType*: jint
  mimeType*: string

