import jnim

jclass android.net.QosCallback* of JVMObject:
  proc onError*(exception: QosCallbackException)
  proc onQosSessionAvailable*(session: QosSession, sessionAttributes: QosSessionAttributes)
  proc onQosSessionLost*(session: QosSession)

jclass android.net.QosCallbackRegistrationException* of RuntimeException:

