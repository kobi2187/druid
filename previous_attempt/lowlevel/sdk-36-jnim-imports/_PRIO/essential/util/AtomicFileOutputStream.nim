import jnim

jclass android.util.AtomicFileOutputStream* of FileOutputStream:
  proc markSuccess*()
  proc close*()
  proc toString*(): string

