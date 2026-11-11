import jnim

jclass android.accessibilityservice.FingerprintGestureController* of JVMObject:
  proc isGestureDetectionAvailable*(): jboolean
  proc registerFingerprintGestureCallback*(callback: FingerprintGestureCallback, handler: Handler)
  proc unregisterFingerprintGestureCallback*(callback: FingerprintGestureCallback)
  proc onGestureDetectionActiveChanged*(active: jboolean)
  proc onGesture*(gesture: jint)
  FINGERPRINT_GESTURE_SWIPE_RIGHT*: jint {.`static`.}
  FINGERPRINT_GESTURE_SWIPE_LEFT*: jint {.`static`.}
  FINGERPRINT_GESTURE_SWIPE_UP*: jint {.`static`.}
  FINGERPRINT_GESTURE_SWIPE_DOWN*: jint {.`static`.}

jclass android.accessibilityservice.FingerprintGestureController.FingerprintGestureCallback* of JVMObject:
  proc onGestureDetectionAvailabilityChanged*(available: jboolean)
  proc onGestureDetected*(gesture: jint)

jclass android.accessibilityservice.FingerprintGestureCallback* of JVMObject:
  proc onGestureDetectionAvailabilityChanged*(available: jboolean)
  proc onGestureDetected*(gesture: jint)

