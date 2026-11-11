import jnim

jclass java.util.Base64* of JVMObject:
  proc getEncoder*(): Encoder {.`static`.}
  proc getUrlEncoder*(): Encoder {.`static`.}
  proc getMimeEncoder*(): Encoder {.`static`.}
  proc getMimeEncoder*(lineLength: jint, lineSeparator: seq[jbyte]): Encoder {.`static`.}
  proc getDecoder*(): Decoder {.`static`.}
  proc getUrlDecoder*(): Decoder {.`static`.}
  proc getMimeDecoder*(): Decoder {.`static`.}

jclass java.util.Base64.Encoder* of JVMObject:
  proc encode*(src: seq[jbyte]): seq[jbyte]
  proc encode*(src: seq[jbyte], dst: seq[jbyte]): jint
  proc encodeToString*(src: seq[jbyte]): string
  proc encode*(buffer: ByteBuffer): ByteBuffer
  proc wrap*(os: OutputStream): OutputStream
  proc withoutPadding*(): Encoder

jclass java.util.Base64.Decoder* of JVMObject:
  proc decode*(src: seq[jbyte]): seq[jbyte]
  proc decode*(src: string): seq[jbyte]
  proc decode*(src: seq[jbyte], dst: seq[jbyte]): jint
  proc decode*(buffer: ByteBuffer): ByteBuffer
  proc wrap*(is: InputStream): InputStream

jclass java.util.Encoder* of JVMObject:
  proc encode*(src: seq[jbyte]): seq[jbyte]
  proc encode*(src: seq[jbyte], dst: seq[jbyte]): jint
  proc encodeToString*(src: seq[jbyte]): string
  proc encode*(buffer: ByteBuffer): ByteBuffer
  proc wrap*(os: OutputStream): OutputStream
  proc withoutPadding*(): Encoder

jclass java.util.Decoder* of JVMObject:
  proc decode*(src: seq[jbyte]): seq[jbyte]
  proc decode*(src: string): seq[jbyte]
  proc decode*(src: seq[jbyte], dst: seq[jbyte]): jint
  proc decode*(buffer: ByteBuffer): ByteBuffer
  proc wrap*(is: InputStream): InputStream

