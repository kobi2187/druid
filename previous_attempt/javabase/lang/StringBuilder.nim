import jnim

jclass java.lang.StringBuilder* of AbstractStringBuilder:
  proc compareTo*(another: StringBuilder): jint
  proc append*(obj: JObject): StringBuilder
  proc append*(str: string): StringBuilder
  proc append*(sb: StringBuffer): StringBuilder
  proc append*(s: CharSequence): StringBuilder
  proc append*(s: CharSequence, start: jint, end: jint): StringBuilder
  proc append*(str: seq[jchar]): StringBuilder
  proc append*(str: seq[jchar], offset: jint, len: jint): StringBuilder
  proc append*(b: jboolean): StringBuilder
  proc append*(c: jchar): StringBuilder
  proc append*(i: jint): StringBuilder
  proc append*(lng: jlong): StringBuilder
  proc append*(f: jfloat): StringBuilder
  proc append*(d: jdouble): StringBuilder
  proc appendCodePoint*(codePoint: jint): StringBuilder
  proc delete*(start: jint, end: jint): StringBuilder
  proc deleteCharAt*(index: jint): StringBuilder
  proc replace*(start: jint, end: jint, str: string): StringBuilder
  proc insert*(index: jint, str: seq[jchar], offset: jint, len: jint): StringBuilder
  proc insert*(offset: jint, obj: JObject): StringBuilder
  proc insert*(offset: jint, str: string): StringBuilder
  proc insert*(offset: jint, str: seq[jchar]): StringBuilder
  proc insert*(dstOffset: jint, s: CharSequence): StringBuilder
  proc insert*(dstOffset: jint, s: CharSequence, start: jint, end: jint): StringBuilder
  proc insert*(offset: jint, b: jboolean): StringBuilder
  proc insert*(offset: jint, c: jchar): StringBuilder
  proc insert*(offset: jint, i: jint): StringBuilder
  proc insert*(offset: jint, l: jlong): StringBuilder
  proc insert*(offset: jint, f: jfloat): StringBuilder
  proc insert*(offset: jint, d: jdouble): StringBuilder
  proc indexOf*(str: string): jint
  proc indexOf*(str: string, fromIndex: jint): jint
  proc lastIndexOf*(str: string): jint
  proc lastIndexOf*(str: string, fromIndex: jint): jint
  proc reverse*(): StringBuilder
  proc repeat*(codePoint: jint, count: jint): StringBuilder
  proc repeat*(cs: CharSequence, count: jint): StringBuilder
  proc toString*(): string

