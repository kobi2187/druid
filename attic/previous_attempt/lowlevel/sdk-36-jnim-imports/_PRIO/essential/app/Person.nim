import jnim

jclass android.app.Person* of JVMObject:
  proc toBuilder*(): Builder
  proc getUri*(): string
  proc getName*(): CharSequence
  proc getIcon*(): Icon
  proc getKey*(): string
  proc isBot*(): jboolean
  proc isImportant*(): jboolean
  proc resolveToLegacyUri*(): string
  proc getIconUri*(): Uri
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc visitUris*(visitor: Consumer[Uri])
  CREATOR*: Creator[Person] {.`static`.}

jclass android.app.Person.Builder* of JVMObject:
  proc setName*(name: CharSequence): Person.Builder
  proc setIcon*(icon: Icon): Person.Builder
  proc setUri*(uri: string): Person.Builder
  proc setKey*(key: string): Person.Builder
  proc setImportant*(isImportant: jboolean): Person.Builder
  proc setBot*(isBot: jboolean): Person.Builder
  proc build*(): Person

jclass android.app.Builder* of JVMObject:
  proc setName*(name: CharSequence): Person.Builder
  proc setIcon*(icon: Icon): Person.Builder
  proc setUri*(uri: string): Person.Builder
  proc setKey*(key: string): Person.Builder
  proc setImportant*(isImportant: jboolean): Person.Builder
  proc setBot*(isBot: jboolean): Person.Builder
  proc build*(): Person

