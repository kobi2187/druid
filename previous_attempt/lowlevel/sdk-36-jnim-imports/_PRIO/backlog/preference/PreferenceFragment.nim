import jnim

jclass android.preference.PreferenceFragment* of Fragment:
  proc onCreate*(savedInstanceState: Bundle)
  proc onCreateView*(inflater: LayoutInflater, container: ViewGroup, savedInstanceState: Bundle): View
  proc onViewCreated*(view: View, savedInstanceState: Bundle)
  proc onActivityCreated*(savedInstanceState: Bundle)
  proc onStart*()
  proc onStop*()
  proc onDestroyView*()
  proc onDestroy*()
  proc onSaveInstanceState*(outState: Bundle)
  proc onActivityResult*(requestCode: jint, resultCode: jint, data: Intent)
  proc getPreferenceManager*(): PreferenceManager
  proc setPreferenceScreen*(preferenceScreen: PreferenceScreen)
  proc getPreferenceScreen*(): PreferenceScreen
  proc addPreferencesFromIntent*(intent: Intent)
  proc addPreferencesFromResource*(preferencesResId: jint)
  proc onPreferenceTreeClick*(preferenceScreen: PreferenceScreen, preference: Preference): jboolean
  proc findPreference*(key: CharSequence): Preference
  proc getListView*(): ListView
  proc hasListView*(): jboolean

