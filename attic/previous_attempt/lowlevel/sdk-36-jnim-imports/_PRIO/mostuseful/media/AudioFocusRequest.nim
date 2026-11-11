import jnim

jclass android.media.AudioFocusRequest* of JVMObject:
  proc getOnAudioFocusChangeListener*(): OnAudioFocusChangeListener
  proc getOnAudioFocusChangeListenerHandler*(): Handler
  proc getAudioAttributes*(): AudioAttributes
  proc getFocusGain*(): jint
  proc willPauseWhenDucked*(): jboolean
  proc acceptsDelayedFocusGain*(): jboolean
  proc locksFocus*(): jboolean
  KEY_ACCESSIBILITY_FORCE_FOCUS_DUCKING*: string {.`static`.}

jclass android.media.AudioFocusRequest.Builder* of JVMObject:
  proc setFocusGain*(focusGain: jint): Builder
  proc setOnAudioFocusChangeListener*(listener: OnAudioFocusChangeListener): Builder
  proc setOnAudioFocusChangeListener*(listener: OnAudioFocusChangeListener, handler: Handler): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setWillPauseWhenDucked*(pauseOnDuck: jboolean): Builder
  proc setAcceptsDelayedFocusGain*(acceptsDelayedFocusGain: jboolean): Builder
  proc setLocksFocus*(focusLocked: jboolean): Builder
  proc setForceDucking*(forceDucking: jboolean): Builder
  proc build*(): AudioFocusRequest

jclass android.media.Builder* of JVMObject:
  proc setFocusGain*(focusGain: jint): Builder
  proc setOnAudioFocusChangeListener*(listener: OnAudioFocusChangeListener): Builder
  proc setOnAudioFocusChangeListener*(listener: OnAudioFocusChangeListener, handler: Handler): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setWillPauseWhenDucked*(pauseOnDuck: jboolean): Builder
  proc setAcceptsDelayedFocusGain*(acceptsDelayedFocusGain: jboolean): Builder
  proc setLocksFocus*(focusLocked: jboolean): Builder
  proc setForceDucking*(forceDucking: jboolean): Builder
  proc build*(): AudioFocusRequest

