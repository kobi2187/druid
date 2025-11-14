import jnim

jclass android.os.NewUserResponse* of JVMObject:
  proc isSuccessful*(): jboolean
  proc getUser*(): UserHandle
  proc getOperationResult*(): jint
  proc toString*(): string

