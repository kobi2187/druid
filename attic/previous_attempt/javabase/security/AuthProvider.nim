import jnim

jclass java.security.AuthProvider* of Provider:
  proc login*(subject: Subject, handler: CallbackHandler)
  proc logout*()
  proc setCallbackHandler*(handler: CallbackHandler)

