import jnim

jclass android.os.PerfettoTrackEventExtra* of JVMObject:
  proc builder*(isCategoryEnabled: jboolean): Builder {.`static`.}
  proc getPtr*(): jlong
  proc addPerfettoPointer*(extra: PerfettoPointer)
  proc addPerfettoPointer*(container: FieldContainer, extra: PerfettoPointer)
  proc reset*()

jclass android.os.PerfettoTrackEventExtra.Builder* of JVMObject:
  proc emit*()
  proc init*(traceType: jint, category: PerfettoTrace.Category): Builder
  proc setEventName*(eventName: string): Builder
  proc addArg*(name: string, val: jlong): Builder
  proc addArg*(name: string, val: jboolean): Builder
  proc addArg*(name: string, val: jdouble): Builder
  proc addArg*(name: string, val: string): Builder
  proc setFlow*(id: jlong): Builder
  proc setTerminatingFlow*(id: jlong): Builder
  proc usingNamedTrack*(parentUuid: jlong, name: string): Builder
  proc usingProcessNamedTrack*(name: string): Builder
  proc usingThreadNamedTrack*(tid: jlong, name: string): Builder
  proc usingCounterTrack*(parentUuid: jlong, name: string): Builder
  proc usingProcessCounterTrack*(name: string): Builder
  proc usingThreadCounterTrack*(tid: jlong, name: string): Builder
  proc setCounter*(val: jlong): Builder
  proc setCounter*(val: jdouble): Builder
  proc addField*(id: jlong, val: jlong): Builder
  proc addField*(id: jlong, val: jdouble): Builder
  proc addField*(id: jlong, val: string): Builder
  proc beginProto*(): Builder
  proc endProto*(): Builder
  proc beginNested*(id: jlong): Builder
  proc endNested*(): Builder



jclass android.os.Builder* of JVMObject:
  proc emit*()
  proc init*(traceType: jint, category: PerfettoTrace.Category): Builder
  proc setEventName*(eventName: string): Builder
  proc addArg*(name: string, val: jlong): Builder
  proc addArg*(name: string, val: jboolean): Builder
  proc addArg*(name: string, val: jdouble): Builder
  proc addArg*(name: string, val: string): Builder
  proc setFlow*(id: jlong): Builder
  proc setTerminatingFlow*(id: jlong): Builder
  proc usingNamedTrack*(parentUuid: jlong, name: string): Builder
  proc usingProcessNamedTrack*(name: string): Builder
  proc usingThreadNamedTrack*(tid: jlong, name: string): Builder
  proc usingCounterTrack*(parentUuid: jlong, name: string): Builder
  proc usingProcessCounterTrack*(name: string): Builder
  proc usingThreadCounterTrack*(tid: jlong, name: string): Builder
  proc setCounter*(val: jlong): Builder
  proc setCounter*(val: jdouble): Builder
  proc addField*(id: jlong, val: jlong): Builder
  proc addField*(id: jlong, val: jdouble): Builder
  proc addField*(id: jlong, val: string): Builder
  proc beginProto*(): Builder
  proc endProto*(): Builder
  proc beginNested*(id: jlong): Builder
  proc endNested*(): Builder

