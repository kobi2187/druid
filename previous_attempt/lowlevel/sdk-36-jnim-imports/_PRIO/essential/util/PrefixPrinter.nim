import jnim

jclass android.util.PrefixPrinter* of JVMObject:
  proc create*(printer: Printer, prefix: string): Printer {.`static`.}
  proc println*(str: string)

