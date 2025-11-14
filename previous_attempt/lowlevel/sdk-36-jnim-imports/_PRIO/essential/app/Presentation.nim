import jnim

jclass android.app.Presentation* of Dialog:
  proc getDisplay*(): Display
  proc getResources*(): Resources
  proc show*()
  proc onDisplayRemoved*()
  proc onDisplayChanged*()

