import jnim

jclass java.util.Currency* of JVMObject:
  proc getInstance*(currencyCode: string): Currency {.`static`.}
  proc getInstance*(locale: Locale): Currency {.`static`.}
  proc getAvailableCurrencies*(): Set[Currency] {.`static`.}
  proc availableCurrencies*(): Stream[Currency] {.`static`.}
  proc getCurrencyCode*(): string
  proc getSymbol*(): string
  proc getSymbol*(locale: Locale): string
  proc getDefaultFractionDigits*(): jint
  proc getNumericCode*(): jint
  proc getNumericCodeAsString*(): string
  proc getDisplayName*(): string
  proc getDisplayName*(locale: Locale): string
  proc toString*(): string

