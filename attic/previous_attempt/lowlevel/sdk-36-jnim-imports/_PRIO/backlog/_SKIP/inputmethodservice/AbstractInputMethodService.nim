import jnim

jclass android.inputmethodservice.AbstractInputMethodService* of WindowProviderService:
  proc getInputMethodInternal*(): InputMethod
  proc getKeyDispatcherState*(): KeyEvent.DispatcherState
  proc onCreateInputMethodInterface*(): AbstractInputMethodImpl
  proc onCreateInputMethodSessionInterface*(): AbstractInputMethodSessionImpl
  proc onBind*(intent: Intent): IBinder
  proc onTrackballEvent*(event: MotionEvent): jboolean
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc onShouldVerifyKeyEvent*(event: KeyEvent): jboolean
  proc getWindowType*(): jint
  proc getWindowContextOptions*(): Bundle
  proc getInitialDisplayId*(): jint

jclass android.inputmethodservice.AbstractInputMethodService.AbstractInputMethodImpl* of JVMObject:
  proc createSession*(callback: SessionCallback)
  proc setSessionEnabled*(session: InputMethodSession, enabled: jboolean)
  proc revokeSession*(session: InputMethodSession)

jclass android.inputmethodservice.AbstractInputMethodService.AbstractInputMethodSessionImpl* of JVMObject:
  proc isEnabled*(): jboolean
  proc isRevoked*(): jboolean
  proc setEnabled*(enabled: jboolean)
  proc revokeSelf*()
  proc dispatchKeyEvent*(seq: jint, event: KeyEvent, callback: EventCallback)
  proc onShouldVerifyKeyEvent*(event: KeyEvent): jboolean
  proc dispatchTrackballEvent*(seq: jint, event: MotionEvent, callback: EventCallback)
  proc dispatchGenericMotionEvent*(seq: jint, event: MotionEvent, callback: EventCallback)

jclass android.inputmethodservice.AbstractInputMethodImpl* of JVMObject:
  proc createSession*(callback: SessionCallback)
  proc setSessionEnabled*(session: InputMethodSession, enabled: jboolean)
  proc revokeSession*(session: InputMethodSession)

jclass android.inputmethodservice.AbstractInputMethodSessionImpl* of JVMObject:
  proc isEnabled*(): jboolean
  proc isRevoked*(): jboolean
  proc setEnabled*(enabled: jboolean)
  proc revokeSelf*()
  proc dispatchKeyEvent*(seq: jint, event: KeyEvent, callback: EventCallback)
  proc onShouldVerifyKeyEvent*(event: KeyEvent): jboolean
  proc dispatchTrackballEvent*(seq: jint, event: MotionEvent, callback: EventCallback)
  proc dispatchGenericMotionEvent*(seq: jint, event: MotionEvent, callback: EventCallback)

