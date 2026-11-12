import jnim

jclass java.lang.StringBuffer* of AbstractStringBuilder:
  proc compareTo*(another: StringBuffer): jint
  proc length*(): jint
  proc capacity*(): jint
  proc ensureCapacity*(minimumCapacity: jint)
  proc trimToSize*()
  proc setLength*(newLength: jint)
  proc charAt*(index: jint): jchar
  proc codePointAt*(index: jint): jint
  proc codePointBefore*(index: jint): jint
  proc codePointCount*(beginIndex: jint, endIndex: jint): jint
  proc offsetByCodePoints*(index: jint, codePointOffset: jint): jint
  proc getChars*(srcBegin: jint, srcEnd: jint, dst: seq[jchar], dstBegin: jint)
  proc setCharAt*(index: jint, ch: jchar)
  proc append*(obj: JObject): StringBuffer
  proc append*(str: string): StringBuffer
  proc append*(sb: StringBuffer): StringBuffer
  proc append*(s: CharSequence): StringBuffer
  proc append*(s: CharSequence, start: jint, end: jint): StringBuffer
  proc append*(str: seq[jchar]): StringBuffer
  proc append*(str: seq[jchar], offset: jint, len: jint): StringBuffer
  proc append*(b: jboolean): StringBuffer
  proc append*(c: jchar): StringBuffer
  proc append*(i: jint): StringBuffer
  proc appendCodePoint*(codePoint: jint): StringBuffer
  proc append*(lng: jlong): StringBuffer
  proc append*(f: jfloat): StringBuffer
  proc append*(d: jdouble): StringBuffer
  proc delete*(start: jint, end: jint): StringBuffer
  proc deleteCharAt*(index: jint): StringBuffer
  proc replace*(start: jint, end: jint, str: string): StringBuffer
  proc substring*(start: jint): string
  proc subSequence*(start: jint, end: jint): CharSequence
  proc substring*(start: jint, end: jint): string
  proc insert*(index: jint, str: seq[jchar], offset: jint, len: jint): StringBuffer
  proc insert*(offset: jint, obj: JObject): StringBuffer
  proc insert*(offset: jint, str: string): StringBuffer
  proc insert*(offset: jint, str: seq[jchar]): StringBuffer
  proc insert*(dstOffset: jint, s: CharSequence): StringBuffer
  proc insert*(dstOffset: jint, s: CharSequence, start: jint, end: jint): StringBuffer
  proc insert*(offset: jint, b: jboolean): StringBuffer
  proc insert*(offset: jint, c: jchar): StringBuffer
  proc insert*(offset: jint, i: jint): StringBuffer
  proc insert*(offset: jint, l: jlong): StringBuffer
  proc insert*(offset: jint, f: jfloat): StringBuffer
  proc insert*(offset: jint, d: jdouble): StringBuffer
  proc indexOf*(str: string): jint
  proc indexOf*(str: string, fromIndex: jint): jint
  proc lastIndexOf*(str: string): jint
  proc lastIndexOf*(str: string, fromIndex: jint): jint
  proc reverse*(): StringBuffer
  proc repeat*(codePoint: jint, count: jint): StringBuffer
  proc repeat*(cs: CharSequence, count: jint): StringBuffer
  proc toString*(): string

