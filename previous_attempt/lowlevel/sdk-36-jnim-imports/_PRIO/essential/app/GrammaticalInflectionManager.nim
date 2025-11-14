import jnim

jclass android.app.GrammaticalInflectionManager* of JVMObject:
  proc getApplicationGrammaticalGender*(): jint
  proc setRequestedApplicationGrammaticalGender*(grammaticalGender: jint)
  proc setSystemWideGrammaticalGender*(grammaticalGender: jint)
  proc getSystemGrammaticalGender*(): jint
  proc peekSystemGrammaticalGenderByUserId*(userId: jint): jint
  VALID_GRAMMATICAL_GENDER_VALUES*: Set[Integer] {.`static`.}

