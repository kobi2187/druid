import jnim

jclass android.telecom.PhoneAccountSuggestionService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onAccountSuggestionRequest*(number: string)
  proc suggestPhoneAccounts*(number: string, suggestions: List[PhoneAccountSuggestion])
  SERVICE_INTERFACE*: string {.`static`.}

