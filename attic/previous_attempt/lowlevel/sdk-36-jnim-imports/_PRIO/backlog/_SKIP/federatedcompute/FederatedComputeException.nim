import jnim

jclass android.federatedcompute.FederatedComputeException* of Exception:
  proc getErrorCode*(): jint
  INTERNAL_ERROR*: jint {.`static`.}

