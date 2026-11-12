## What the NDK answers directly, without the JVM: system properties and the
## API level. Usable before Druid is started, from any thread.
##
## ```nim
## when defined(android):
##   echo "API ", ndkApiLevel(), " on ", systemProperty("ro.product.model")
## ```

when defined(android):
  import std/strutils
  const propValueMax = 92   # PROP_VALUE_MAX
  proc systemPropertyGet(name, value: cstring): cint {.importc: "__system_property_get", header: "<sys/system_properties.h>".}

  proc systemProperty*(name: string): string =
    ## An Android system property ("ro.build.version.sdk", "ro.product.model"); "" if unset.
    var buf: array[propValueMax, char]
    let n = systemPropertyGet(name.cstring, cast[cstring](addr buf[0]))
    if n <= 0: return ""
    result = newString(n)
    copyMem(addr result[0], addr buf[0], n)

  proc ndkApiLevel*(): int =
    ## The device's API level, read without JNI.
    try: parseInt(systemProperty("ro.build.version.sdk"))
    except ValueError: 0
else:
  proc systemProperty*(name: string): string = ""
    ## "" off Android.
  proc ndkApiLevel*(): int = 0
    ## 0 off Android.
