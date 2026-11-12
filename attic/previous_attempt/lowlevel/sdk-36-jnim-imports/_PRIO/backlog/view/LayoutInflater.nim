import jnim

jclass android.view.LayoutInflater* of JVMObject:
  proc from*(context: Context): LayoutInflater {.`static`.}
  proc cloneInContext*(newContext: Context): LayoutInflater
  proc getContext*(): Context
  proc getFactory*(): Factory
  proc getFactory2*(): Factory2
  proc setFactory*(factory: Factory)
  proc setFactory2*(factory: Factory2)
  proc setPrivateFactory*(factory: Factory2)
  proc getFilter*(): Filter
  proc setFilter*(filter: Filter)
  proc inflate*(resource: jint, root: ViewGroup): View
  proc inflate*(parser: XmlPullParser, root: ViewGroup): View
  proc inflate*(resource: jint, root: ViewGroup, attachToRoot: jboolean): View
  proc inflate*(parser: XmlPullParser, root: ViewGroup, attachToRoot: jboolean): View
  proc createView*(name: string, prefix: string, attrs: AttributeSet): View
  proc createView*(viewContext: Context, name: string, prefix: string, attrs: AttributeSet): View
  proc onCreateView*(viewContext: Context, parent: View, name: string, attrs: AttributeSet): View
  proc tryCreateView*(parent: View, name: string, context: Context, attrs: AttributeSet): View



jclass android.view.Factory2* of Factory:

