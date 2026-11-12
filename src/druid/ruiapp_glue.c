/* The JavaVM and Activity of the NativeActivity raylib runs RUI in
 * (android_native_app_glue's struct android_app, from raylib's GetAndroidApp). */
#include <jni.h>
#include <android/native_activity.h>
#include <android_native_app_glue.h>

struct android_app *GetAndroidApp(void);

int druid_rui_activity(void **vm, void **activity) {
  struct android_app *app = GetAndroidApp();
  if (!app || !app->activity || !app->activity->vm || !app->activity->clazz) return 0;
  *vm = app->activity->vm;
  *activity = app->activity->clazz;
  return 1;
}
