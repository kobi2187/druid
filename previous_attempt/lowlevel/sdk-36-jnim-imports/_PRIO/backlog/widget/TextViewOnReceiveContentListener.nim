import jnim

jclass android.widget.TextViewOnReceiveContentListener* of JVMObject:
  proc onReceiveContent*(view: View, payload: ContentInfo): ContentInfo
  proc getFallbackMimeTypesForAutofill*(view: TextView): seq[string]

