import jnim

jclass android.widget.ActivityChooserModel* of DataSetObservable:
  proc get*(context: Context, historyFileName: string): ActivityChooserModel {.`static`.}
  proc setIntent*(intent: Intent)
  proc getIntent*(): Intent
  proc getActivityCount*(): jint
  proc getActivity*(index: jint): ResolveInfo
  proc getActivityIndex*(activity: ResolveInfo): jint
  proc chooseActivity*(index: jint): Intent
  proc setOnChooseActivityListener*(listener: OnChooseActivityListener)
  proc getDefaultActivity*(): ResolveInfo
  proc setDefaultActivity*(index: jint)
  proc setActivitySorter*(activitySorter: ActivitySorter)
  proc setHistoryMaxSize*(historyMaxSize: jint)
  proc getHistoryMaxSize*(): jint
  proc getHistorySize*(): jint
  DEFAULT_HISTORY_FILE_NAME*: string {.`static`.}
  DEFAULT_HISTORY_MAX_LENGTH*: jint {.`static`.}

jclass android.widget.ActivityChooserModel.ActivityChooserModelClient* of JVMObject:
  proc setActivityChooserModel*(dataModel: ActivityChooserModel)

jclass android.widget.ActivityChooserModel.ActivitySorter* of JVMObject:
  proc sort*(intent: Intent, activities: List[ActivityResolveInfo], historicalRecords: List[HistoricalRecord])

jclass android.widget.ActivityChooserModel.OnChooseActivityListener* of JVMObject:
  proc onChooseActivity*(host: ActivityChooserModel, intent: Intent): jboolean

jclass android.widget.ActivityChooserModel.HistoricalRecord* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string

jclass android.widget.ActivityChooserModel.ActivityResolveInfo* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc compareTo*(another: ActivityResolveInfo): jint
  proc toString*(): string

jclass android.widget.ActivityChooserModelClient* of JVMObject:
  proc setActivityChooserModel*(dataModel: ActivityChooserModel)

jclass android.widget.ActivitySorter* of JVMObject:
  proc sort*(intent: Intent, activities: List[ActivityResolveInfo], historicalRecords: List[HistoricalRecord])

jclass android.widget.OnChooseActivityListener* of JVMObject:
  proc onChooseActivity*(host: ActivityChooserModel, intent: Intent): jboolean

jclass android.widget.HistoricalRecord* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  activity*: ComponentName
  time*: jlong
  weight*: jfloat

jclass android.widget.ActivityResolveInfo* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc compareTo*(another: ActivityResolveInfo): jint
  proc toString*(): string
  resolveInfo*: ResolveInfo
  weight*: jfloat

