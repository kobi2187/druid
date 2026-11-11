import jnim

jclass android.content.RestrictionEntry* of JVMObject:
  proc createBundleEntry*(key: string, restrictionEntries: seq[RestrictionEntry]): RestrictionEntry {.`static`.}
  proc createBundleArrayEntry*(key: string, restrictionEntries: seq[RestrictionEntry]): RestrictionEntry {.`static`.}
  proc setType*(type: jint)
  proc getType*(): jint
  proc getSelectedString*(): string
  proc getAllSelectedStrings*(): seq[string]
  proc getSelectedState*(): jboolean
  proc getIntValue*(): jint
  proc setIntValue*(value: jint)
  proc setSelectedString*(selectedString: string)
  proc setSelectedState*(state: jboolean)
  proc setAllSelectedStrings*(allSelectedStrings: seq[string])
  proc setChoiceValues*(choiceValues: seq[string])
  proc setChoiceValues*(context: Context, stringArrayResId: jint)
  proc getRestrictions*(): seq[RestrictionEntry]
  proc setRestrictions*(restrictions: seq[RestrictionEntry])
  proc getChoiceValues*(): seq[string]
  proc setChoiceEntries*(choiceEntries: seq[string])
  proc setChoiceEntries*(context: Context, stringArrayResId: jint)
  proc getChoiceEntries*(): seq[string]
  proc getDescription*(): string
  proc setDescription*(description: string)
  proc getKey*(): string
  proc getTitle*(): string
  proc setTitle*(title: string)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  TYPE_NULL*: jint {.`static`.}
  TYPE_BOOLEAN*: jint {.`static`.}
  TYPE_CHOICE*: jint {.`static`.}
  TYPE_CHOICE_LEVEL*: jint {.`static`.}
  TYPE_MULTI_SELECT*: jint {.`static`.}
  TYPE_INTEGER*: jint {.`static`.}
  TYPE_STRING*: jint {.`static`.}
  TYPE_BUNDLE*: jint {.`static`.}
  TYPE_BUNDLE_ARRAY*: jint {.`static`.}
  CREATOR*: Creator[RestrictionEntry] {.`static`.}

