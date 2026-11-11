import jnim

jclass android.app.SystemServiceRegistry* of JVMObject:
  proc createServiceCache*(): seq[JObject] {.`static`.}
  proc getSystemService*(ctx: ContextImpl, name: string): JObject {.`static`.}
  proc getSystemServiceWithNoContext*(name: string): JObject {.`static`.}
  proc getSystemServiceName*(serviceClass: Class[?]): string {.`static`.}
  proc getSystemServiceClassName*(name: string): string {.`static`.}
  proc registerStaticService*(serviceName: string, serviceWrapperClass: Class[TServiceClass], serviceProducer: StaticServiceProducerWithBinder[TServiceClass]) {.`static`.}
  proc registerForeverStaticService*(serviceName: string, serviceWrapperClass: Class[TServiceClass], serviceProducer: StaticServiceProducerWithBinder[TServiceClass]) {.`static`.}
  proc registerStaticService*(serviceName: string, serviceWrapperClass: Class[TServiceClass], serviceProducer: StaticServiceProducerWithoutBinder[TServiceClass]) {.`static`.}
  proc registerContextAwareService*(serviceName: string, serviceWrapperClass: Class[TServiceClass], serviceProducer: ContextAwareServiceProducerWithBinder[TServiceClass]) {.`static`.}
  proc registerContextAwareService*(serviceName: string, serviceWrapperClass: Class[TServiceClass], serviceProducer: ContextAwareServiceProducerWithoutBinder[TServiceClass]) {.`static`.}
  proc onServiceNotFound*(e: ServiceNotFoundException) {.`static`.}
  sEnableServiceNotFoundWtf*: jboolean {.`static`.}



