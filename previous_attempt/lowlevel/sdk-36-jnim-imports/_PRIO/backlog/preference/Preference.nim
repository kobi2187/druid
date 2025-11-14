import jnim

jclass android.preference.Preference* of JVMObject:
  proc setIntent*(intent: Intent)
  proc getIntent*(): Intent
  proc setFragment*(fragment: string)
  proc getFragment*(): string
  proc setPreferenceDataStore*(dataStore: PreferenceDataStore)
  proc getPreferenceDataStore*(): PreferenceDataStore
  proc getExtras*(): Bundle
  proc peekExtras*(): Bundle
  proc setLayoutResource*(layoutResId: jint)
  proc getLayoutResource*(): jint
  proc setWidgetLayoutResource*(widgetLayoutResId: jint)
  proc getWidgetLayoutResource*(): jint
  proc getView*(convertView: View, parent: ViewGroup): View
  proc setOrder*(order: jint)
  proc getOrder*(): jint
  proc setTitle*(title: CharSequence)
  proc setTitle*(titleResId: jint)
  proc getTitleRes*(): jint
  proc getTitle*(): CharSequence
  proc setIcon*(icon: Drawable)
  proc setIcon*(iconResId: jint)
  proc getIcon*(): Drawable
  proc getSummary*(): CharSequence
  proc setSummary*(summary: CharSequence)
  proc setSummary*(summaryResId: jint)
  proc setEnabled*(enabled: jboolean)
  proc isEnabled*(): jboolean
  proc setSelectable*(selectable: jboolean)
  proc isSelectable*(): jboolean
  proc setShouldDisableView*(shouldDisableView: jboolean)
  proc getShouldDisableView*(): jboolean
  proc setRecycleEnabled*(enabled: jboolean)
  proc isRecycleEnabled*(): jboolean
  proc setSingleLineTitle*(singleLineTitle: jboolean)
  proc isSingleLineTitle*(): jboolean
  proc setIconSpaceReserved*(iconSpaceReserved: jboolean)
  proc isIconSpaceReserved*(): jboolean
  proc setKey*(key: string)
  proc getKey*(): string
  proc hasKey*(): jboolean
  proc isPersistent*(): jboolean
  proc setPersistent*(persistent: jboolean)
  proc setOnPreferenceChangeListener*(onPreferenceChangeListener: OnPreferenceChangeListener)
  proc getOnPreferenceChangeListener*(): OnPreferenceChangeListener
  proc setOnPreferenceClickListener*(onPreferenceClickListener: OnPreferenceClickListener)
  proc getOnPreferenceClickListener*(): OnPreferenceClickListener
  proc performClick*(preferenceScreen: PreferenceScreen)
  proc onKey*(v: View, keyCode: jint, event: KeyEvent): jboolean
  proc getContext*(): Context
  proc getSharedPreferences*(): SharedPreferences
  proc getEditor*(): SharedPreferences.Editor
  proc shouldCommit*(): jboolean
  proc compareTo*(another: Preference): jint
  proc getPreferenceManager*(): PreferenceManager
  proc notifyDependencyChange*(disableDependents: jboolean)
  proc onDependencyChanged*(dependency: Preference, disableDependent: jboolean)
  proc onParentChanged*(parent: Preference, disableChild: jboolean)
  proc shouldDisableDependents*(): jboolean
  proc setDependency*(dependencyKey: string)
  proc getDependency*(): string
  proc getParent*(): PreferenceGroup
  proc setDefaultValue*(defaultValue: JObject)
  proc persistStringSet*(values: Set[string]): jboolean
  proc getPersistedStringSet*(defaultReturnValue: Set[string]): Set[string]
  proc toString*(): string
  proc saveHierarchyState*(container: Bundle)
  proc restoreHierarchyState*(container: Bundle)
  DEFAULT_ORDER*: jint {.`static`.}



jclass android.preference.BaseSavedState* of AbsSavedState:
  CREATOR*: Parcelable.Creator[BaseSavedState] {.`static`.}

