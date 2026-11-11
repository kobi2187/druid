import jnim

jclass android.telephony.SmsCbCmasInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getMessageClass*(): jint
  proc getCategory*(): jint
  proc getResponseType*(): jint
  proc getSeverity*(): jint
  proc getUrgency*(): jint
  proc getCertainty*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  CMAS_CLASS_PRESIDENTIAL_LEVEL_ALERT*: jint {.`static`.}
  CMAS_CLASS_EXTREME_THREAT*: jint {.`static`.}
  CMAS_CLASS_SEVERE_THREAT*: jint {.`static`.}
  CMAS_CLASS_CHILD_ABDUCTION_EMERGENCY*: jint {.`static`.}
  CMAS_CLASS_REQUIRED_MONTHLY_TEST*: jint {.`static`.}
  CMAS_CLASS_CMAS_EXERCISE*: jint {.`static`.}
  CMAS_CLASS_OPERATOR_DEFINED_USE*: jint {.`static`.}
  CMAS_CLASS_UNKNOWN*: jint {.`static`.}
  CMAS_CATEGORY_GEO*: jint {.`static`.}
  CMAS_CATEGORY_MET*: jint {.`static`.}
  CMAS_CATEGORY_SAFETY*: jint {.`static`.}
  CMAS_CATEGORY_SECURITY*: jint {.`static`.}
  CMAS_CATEGORY_RESCUE*: jint {.`static`.}
  CMAS_CATEGORY_FIRE*: jint {.`static`.}
  CMAS_CATEGORY_HEALTH*: jint {.`static`.}
  CMAS_CATEGORY_ENV*: jint {.`static`.}
  CMAS_CATEGORY_TRANSPORT*: jint {.`static`.}
  CMAS_CATEGORY_INFRA*: jint {.`static`.}
  CMAS_CATEGORY_CBRNE*: jint {.`static`.}
  CMAS_CATEGORY_OTHER*: jint {.`static`.}
  CMAS_CATEGORY_UNKNOWN*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_SHELTER*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_EVACUATE*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_PREPARE*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_EXECUTE*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_MONITOR*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_AVOID*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_ASSESS*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_NONE*: jint {.`static`.}
  CMAS_RESPONSE_TYPE_UNKNOWN*: jint {.`static`.}
  CMAS_SEVERITY_EXTREME*: jint {.`static`.}
  CMAS_SEVERITY_SEVERE*: jint {.`static`.}
  CMAS_SEVERITY_UNKNOWN*: jint {.`static`.}
  CMAS_URGENCY_IMMEDIATE*: jint {.`static`.}
  CMAS_URGENCY_EXPECTED*: jint {.`static`.}
  CMAS_URGENCY_UNKNOWN*: jint {.`static`.}
  CMAS_CERTAINTY_OBSERVED*: jint {.`static`.}
  CMAS_CERTAINTY_LIKELY*: jint {.`static`.}
  CMAS_CERTAINTY_UNKNOWN*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[SmsCbCmasInfo] {.`static`.}

