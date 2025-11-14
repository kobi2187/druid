import jnim

jclass java.lang.Package* of NamedPackage:
  proc getName*(): string
  proc getSpecificationTitle*(): string
  proc getSpecificationVersion*(): string
  proc getSpecificationVendor*(): string
  proc getImplementationTitle*(): string
  proc getImplementationVersion*(): string
  proc getImplementationVendor*(): string
  proc isSealed*(): jboolean
  proc isSealed*(url: URL): jboolean
  proc isCompatibleWith*(desired: string): jboolean
  proc getPackage*(name: string): Package {.`static`.}
  proc getPackages*(): seq[Package] {.`static`.}
  proc hashCode*(): jint
  proc toString*(): string
  proc getAnnotation*(annotationClass: Class[A]): A
  proc isAnnotationPresent*(annotationClass: Class[? extends Annotation]): jboolean
  proc getAnnotationsByType*(annotationClass: Class[A]): seq[A]
  proc getAnnotations*(): seq[Annotation]
  proc getDeclaredAnnotation*(annotationClass: Class[A]): A
  proc getDeclaredAnnotationsByType*(annotationClass: Class[A]): seq[A]
  proc getDeclaredAnnotations*(): seq[Annotation]

