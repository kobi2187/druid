import jnim

jclass android.os.FactoryTest* of JVMObject:
  proc getMode*(): jint {.`static`.}
  proc isLongPressOnPowerOffEnabled*(): jboolean {.`static`.}
  FACTORY_TEST_OFF*: jint {.`static`.}
  FACTORY_TEST_LOW_LEVEL*: jint {.`static`.}
  FACTORY_TEST_HIGH_LEVEL*: jint {.`static`.}

