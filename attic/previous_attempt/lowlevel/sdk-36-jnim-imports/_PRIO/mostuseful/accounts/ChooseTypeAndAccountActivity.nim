import jnim

jclass android.accounts.ChooseTypeAndAccountActivity* of Activity:
  proc onCreate*(savedInstanceState: Bundle)
  proc onCancelButtonClicked*(view: View)
  proc onOkButtonClicked*(view: View)
  proc run*(accountManagerFuture: AccountManagerFuture[Bundle])
  EXTRA_ALLOWABLE_ACCOUNTS_ARRAYLIST*: string {.`static`.}
  EXTRA_ALLOWABLE_ACCOUNT_TYPES_STRING_ARRAY*: string {.`static`.}
  EXTRA_ADD_ACCOUNT_OPTIONS_BUNDLE*: string {.`static`.}
  EXTRA_ADD_ACCOUNT_REQUIRED_FEATURES_STRING_ARRAY*: string {.`static`.}
  EXTRA_ADD_ACCOUNT_AUTH_TOKEN_TYPE_STRING*: string {.`static`.}
  EXTRA_SELECTED_ACCOUNT*: string {.`static`.}
  EXTRA_ALWAYS_PROMPT_FOR_ACCOUNT*: string {.`static`.}
  EXTRA_DESCRIPTION_TEXT_OVERRIDE*: string {.`static`.}
  REQUEST_NULL*: jint {.`static`.}
  REQUEST_CHOOSE_TYPE*: jint {.`static`.}
  REQUEST_ADD_ACCOUNT*: jint {.`static`.}

