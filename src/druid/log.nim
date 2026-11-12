## Logging that shows up where Android developers look: logcat (`adb logcat
## -s druid`). On the desktop, stderr.
##
## On Android, importing Druid also sends stdout and stderr to logcat (tags
## "stdout" and "stderr"), so `echo`, an unhandled exception's trace and what
## libraries print are not lost; Android discards both streams otherwise.
## `-d:druidKeepStdio` leaves them alone.
##
## ```nim
## logInfo "loaded ", items.len, " items"
## logError "save failed: ", e.msg
## ```

type LogLevel* = enum
  llVerbose = 2, llDebug = 3, llInfo = 4, llWarn = 5, llError = 6

var logTag* = "druid"  ## The tag lines are written under.
var minLevel* = llDebug  ## Lines below this level are dropped.

when defined(android):
  {.passL: "-llog".}
  proc androidLogWrite(prio: cint, tag, text: cstring): cint {.importc: "__android_log_write", header: "<android/log.h>".}

when defined(android):
  {.compile: "log_android.c".}
  proc druidStdioToLogcat(): cint {.importc: "druid_stdio_to_logcat".}

  proc stdioToLogcat*(): bool {.discardable.} =
    ## Send stdout and stderr to logcat from now on. Done when the library
    ## loads unless -d:druidKeepStdio; idempotent.
    druidStdioToLogcat() != 0

  proc nimErrorToLogcat(msg: string) {.nimcall, gcsafe, raises: [].} =
    # Nim's own fatal messages (an unhandled exception's trace) go here.
    discard androidLogWrite(6, "nim", msg.cstring)

  errorMessageWriter = nimErrorToLogcat
  when defined(druidKeepStdio):
    {.passC: "-DDRUID_KEEP_STDIO".}
  # (log_android.c starts the redirect itself, when the library loads.)

proc log*(level: LogLevel, msg: string) =
  if level < minLevel: return
  when defined(android):
    discard androidLogWrite(cint(ord(level)), logTag.cstring, msg.cstring)
  else:
    const names: array[LogLevel, string] = ["V", "D", "I", "W", "E"]
    stderr.writeLine names[level], "/", logTag, ": ", msg

proc concatArgs*(parts: openArray[string]): string =
  for p in parts: result.add p

template logDebug*(args: varargs[string, `$`]) = log(llDebug, concatArgs(args))
template logInfo*(args: varargs[string, `$`]) = log(llInfo, concatArgs(args))
template logWarn*(args: varargs[string, `$`]) = log(llWarn, concatArgs(args))
template logError*(args: varargs[string, `$`]) = log(llError, concatArgs(args))

