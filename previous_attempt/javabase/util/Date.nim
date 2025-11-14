import jnim

jclass java.util.Date* of JVMObject:
  proc clone*(): JObject
  proc UTC*(year: jint, month: jint, date: jint, hrs: jint, min: jint, sec: jint): jlong {.`static`.}
  proc parse*(s: string): jlong {.`static`.}
  proc getYear*(): jint
  proc setYear*(year: jint)
  proc getMonth*(): jint
  proc setMonth*(month: jint)
  proc getDate*(): jint
  proc setDate*(date: jint)
  proc getDay*(): jint
  proc getHours*(): jint
  proc setHours*(hours: jint)
  proc getMinutes*(): jint
  proc setMinutes*(minutes: jint)
  proc getSeconds*(): jint
  proc setSeconds*(seconds: jint)
  proc getTime*(): jlong
  proc setTime*(time: jlong)
  proc before*(when: Date): jboolean
  proc after*(when: Date): jboolean
  proc equals*(obj: JObject): jboolean
  proc compareTo*(anotherDate: Date): jint
  proc hashCode*(): jint
  proc toString*(): string
  proc toLocaleString*(): string
  proc toGMTString*(): string
  proc getTimezoneOffset*(): jint
  proc from*(instant: Instant): Date {.`static`.}
  proc toInstant*(): Instant

