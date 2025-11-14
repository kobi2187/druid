import jnim

jclass android.util.Xml* of JVMObject:
  proc parse*(xml: string, contentHandler: ContentHandler) {.`static`.}
  proc parse*(in: Reader, contentHandler: ContentHandler) {.`static`.}
  proc parse*(in: InputStream, encoding: Encoding, contentHandler: ContentHandler) {.`static`.}
  proc newPullParser*(): XmlPullParser {.`static`.}
  proc newPullParser$ravenwood*(): XmlPullParser {.`static`.}
  proc newFastPullParser*(): TypedXmlPullParser {.`static`.}
  proc newBinaryPullParser*(): TypedXmlPullParser {.`static`.}
  proc newBinaryPullParser$ravenwood*(): TypedXmlPullParser {.`static`.}
  proc resolvePullParser*(in: InputStream): TypedXmlPullParser {.`static`.}
  proc newSerializer*(): XmlSerializer {.`static`.}
  proc newFastSerializer*(): TypedXmlSerializer {.`static`.}
  proc newBinarySerializer*(): TypedXmlSerializer {.`static`.}
  proc newBinarySerializer$ravenwood*(): TypedXmlSerializer {.`static`.}
  proc resolveSerializer*(output:OutputStream): TypedXmlSerializer {.`static`.}
  proc resolveSerializer$ravenwood*(output:OutputStream): TypedXmlSerializer {.`static`.}
  proc copy*(in: XmlPullParser, output:XmlSerializer) {.`static`.}
  proc findEncodingByName*(encodingName: string): Encoding {.`static`.}
  proc asAttributeSet*(parser: XmlPullParser): AttributeSet {.`static`.}
  FEATURE_RELAXED*: string {.`static`.}
  ENABLE_BINARY_DEFAULT*: jboolean {.`static`.}
  ENABLE_RESOLVE_OPTIMIZATIONS*: jboolean {.`static`.}

