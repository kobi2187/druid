import jnim

jclass android.preference.PreferenceActivity* of ListActivity:
  proc onOptionsItemSelected*(item: MenuItem): jboolean
  proc onBackPressed*()
  proc hasHeaders*(): jboolean
  proc getHeaders*(): List[Header]
  proc isMultiPane*(): jboolean
  proc onIsMultiPane*(): jboolean
  proc onIsHidingHeaders*(): jboolean
  proc onGetInitialHeader*(): Header
  proc onGetNewHeader*(): Header
  proc onBuildHeaders*(target: List[Header])
  proc invalidateHeaders*()
  proc loadHeadersFromResource*(resid: jint, target: List[Header])
  proc setListFooter*(view: View)
  proc onContentChanged*()
  proc onHeaderClick*(header: Header, position: jint)
  proc onBuildStartFragmentIntent*(fragmentName: string, args: Bundle, titleRes: jint, shortTitleRes: jint): Intent
  proc startWithFragment*(fragmentName: string, args: Bundle, resultTo: Fragment, resultRequestCode: jint)
  proc startWithFragment*(fragmentName: string, args: Bundle, resultTo: Fragment, resultRequestCode: jint, titleRes: jint, shortTitleRes: jint)
  proc showBreadCrumbs*(title: CharSequence, shortTitle: CharSequence)
  proc setParentTitle*(title: CharSequence, shortTitle: CharSequence, listener: OnClickListener)
  proc switchToHeader*(fragmentName: string, args: Bundle)
  proc switchToHeader*(header: Header)
  proc startPreferenceFragment*(fragment: Fragment, push: jboolean)
  proc startPreferencePanel*(fragmentClass: string, args: Bundle, titleRes: jint, titleText: CharSequence, resultTo: Fragment, resultRequestCode: jint)
  proc finishPreferencePanel*(caller: Fragment, resultCode: jint, resultData: Intent)
  proc onPreferenceStartFragment*(caller: PreferenceFragment, pref: Preference): jboolean
  proc getPreferenceManager*(): PreferenceManager
  proc setPreferenceScreen*(preferenceScreen: PreferenceScreen)
  proc getPreferenceScreen*(): PreferenceScreen
  proc addPreferencesFromIntent*(intent: Intent)
  proc addPreferencesFromResource*(preferencesResId: jint)
  proc onPreferenceTreeClick*(preferenceScreen: PreferenceScreen, preference: Preference): jboolean
  proc findPreference*(key: CharSequence): Preference
  EXTRA_SHOW_FRAGMENT*: string {.`static`.}
  EXTRA_SHOW_FRAGMENT_ARGUMENTS*: string {.`static`.}
  EXTRA_SHOW_FRAGMENT_TITLE*: string {.`static`.}
  EXTRA_SHOW_FRAGMENT_SHORT_TITLE*: string {.`static`.}
  EXTRA_NO_HEADERS*: string {.`static`.}
  HEADER_ID_UNDEFINED*: jlong {.`static`.}

jclass android.preference.PreferenceActivity.Header* of JVMObject:
  proc getTitle*(res: Resources): CharSequence
  proc getSummary*(res: Resources): CharSequence
  proc getBreadCrumbTitle*(res: Resources): CharSequence
  proc getBreadCrumbShortTitle*(res: Resources): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)

jclass android.preference.Header* of JVMObject:
  proc getTitle*(res: Resources): CharSequence
  proc getSummary*(res: Resources): CharSequence
  proc getBreadCrumbTitle*(res: Resources): CharSequence
  proc getBreadCrumbShortTitle*(res: Resources): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  id*: jlong
  titleRes*: jint
  title*: CharSequence
  summaryRes*: jint
  summary*: CharSequence
  breadCrumbTitleRes*: jint
  breadCrumbTitle*: CharSequence
  breadCrumbShortTitleRes*: jint
  breadCrumbShortTitle*: CharSequence
  iconRes*: jint
  fragment*: string
  fragmentArguments*: Bundle
  intent*: Intent
  extras*: Bundle
  CREATOR*: Creator[Header] {.`static`.}

