import jnim

jclass android.accessibilityservice.AccessibilityButtonController* of JVMObject:
  proc isAccessibilityButtonAvailable*(): jboolean
  proc registerAccessibilityButtonCallback*(callback: AccessibilityButtonCallback)
  proc registerAccessibilityButtonCallback*(callback: AccessibilityButtonCallback, handler: Handler)
  proc unregisterAccessibilityButtonCallback*(callback: AccessibilityButtonCallback)

jclass android.accessibilityservice.AccessibilityButtonController.AccessibilityButtonCallback* of JVMObject:
  proc onClicked*(controller: AccessibilityButtonController)
  proc onAvailabilityChanged*(controller: AccessibilityButtonController, available: jboolean)

jclass android.accessibilityservice.AccessibilityButtonCallback* of JVMObject:
  proc onClicked*(controller: AccessibilityButtonController)
  proc onAvailabilityChanged*(controller: AccessibilityButtonController, available: jboolean)

