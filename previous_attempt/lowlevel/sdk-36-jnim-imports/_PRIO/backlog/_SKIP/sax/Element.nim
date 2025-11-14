import jnim

jclass android.sax.Element* of JVMObject:
  proc getChild*(localName: string): Element
  proc getChild*(uri: string, localName: string): Element
  proc requireChild*(localName: string): Element
  proc requireChild*(uri: string, localName: string): Element
  proc setElementListener*(elementListener: ElementListener)
  proc setTextElementListener*(elementListener: TextElementListener)
  proc setStartElementListener*(startElementListener: StartElementListener)
  proc setEndElementListener*(endElementListener: EndElementListener)
  proc setEndTextElementListener*(endTextElementListener: EndTextElementListener)
  proc toString*(): string

