import jnim

jclass android.accounts.CantAddAccountActivity* of Activity:
  proc onCreate*(savedInstanceState: Bundle)
  proc onCancelButtonClicked*(view: View)
  EXTRA_ERROR_CODE*: string {.`static`.}

