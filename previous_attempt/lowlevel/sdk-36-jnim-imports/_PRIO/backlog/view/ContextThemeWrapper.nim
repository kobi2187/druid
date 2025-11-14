import jnim

jclass android.view.ContextThemeWrapper* of ContextWrapper:
  proc applyOverrideConfiguration*(overrideConfiguration: Configuration)
  proc getOverrideConfiguration*(): Configuration
  proc getAssets*(): AssetManager
  proc getResources*(): Resources
  proc setTheme*(resid: jint)
  proc setTheme*(theme: Resources.Theme)
  proc getThemeResId*(): jint
  proc getTheme*(): Resources.Theme
  proc getSystemService*(name: string): JObject

