import jnim

jclass android.rotationresolver.RotationResolverInternal* of JVMObject:
  proc isRotationResolverSupported*(): jboolean
  proc resolveRotation*(callback: RotationResolverCallbackInternal, packageName: string, proposedRotation: jint, currentRotation: jint, timeoutMillis: jlong, cancellationSignal: CancellationSignal)

