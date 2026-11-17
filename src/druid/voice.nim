## The microphone and the speaker, as words: recording to a file, text to
## speech, and speech to text.
##
## ```nim
## # Recording (RECORD_AUDIO):
## recorder().start(storage().filesDir / "memo.m4a", maxDurationMs = 60_000)
## let level = recorder().amplitude          # for a level meter, each frame
## discard recorder().stop()                  # or an ekRecording "limit" event
##
## # Text to speech: open once, wait for tsReady, then speak.
## tts().open()
## discard tts().speak("Hello from Nim")       # ekTts start / done events
##
## # Speech to text (RECORD_AUDIO): no dialog; ekSpeech events.
## let ask = recognizer().start(language = "en-US")
## for ev in pollEvents():
##   if ev.kind == ekSpeech and ev.speech.id == ask.id and ev.speech.kind == skResult:
##     echo ev.speech.texts[0]
## ```
##
## On the desktop: recordings are a second of silence (as long as the
## simulated clock says), the "speaker" prints to stderr and keeps what it
## said (`simulator().spoken`), and the "microphone" hears what
## `simulator().setHeard` says.

import std/[os, strutils]
import bridge, events, simulator

type
  Recorder* = object
  Tts* = object
  Recognizer* = object
  SpeechRequest* = object
    id*: int               ## the `speech.id` of its ekSpeech events
  LanguageSupport* = enum
    lsNotSupported = -2, lsMissingData = -1, lsAvailable = 0, lsCountry = 1, lsVariant = 2

proc recorder*(): Recorder = discard
proc tts*(): Tts = discard
proc recognizer*(): Recognizer = discard

const silence = when defined(android): "" else: staticRead("assets/silence.m4a")

proc requireMic(what: string) =
  if not simPermissionGranted("android.permission.RECORD_AUDIO"):
    raise newException(DruidPermissionError, what & " (simulated): java.lang.SecurityException: needs the RECORD_AUDIO permission")

# ---- recording ----

type SimRecording = object
  on: bool
  path: string
  startedAt, limitMs: int64
  hooked: bool

var simRec {.threadvar.}: SimRecording

proc finishSim(how: string): int64 =
  let ms = simulator().nowMs - simRec.startedAt
  simRec.on = false
  try:
    writeFile(simRec.path, silence)
    postLocal encodeEvent("recording", how, simRec.path, ms, "")
  except IOError as e:
    postLocal encodeEvent("recording", "error", simRec.path, ms, e.msg)
  ms

proc start*(_: Recorder, path: string, maxDurationMs = 0, sampleRate = 44_100, bitRate = 128_000) =
  ## Records the microphone into `path` (AAC, .m4a) until `stop` or
  ## `maxDurationMs` (then an `ekRecording` roLimit event). One at a time.
  if druidStarted():
    callStatic(void, "Recorder", "start", path, maxDurationMs, sampleRate, bitRate)
    return
  requireMic("Recorder.start")
  if simRec.on:
    raise newException(DruidError, "Recorder.start (simulated): java.lang.IllegalStateException: already recording to " & simRec.path)
  if not dirExists(path.parentDir):
    raise newException(DruidError, "Recorder.start (simulated): java.io.FileNotFoundException: " & path)
  simRec = SimRecording(on: true, path: path, startedAt: simulator().nowMs, limitMs: maxDurationMs)
  simOnPoll(proc() =
    if simRec.on and simRec.limitMs > 0 and simulator().nowMs - simRec.startedAt >= simRec.limitMs:
      discard finishSim("limit"))

proc stop*(_: Recorder): int64 {.discardable.} =
  ## Stops and returns the recording's length, ms; an `ekRecording` roStopped event follows.
  if druidStarted(): return callStatic(int64, "Recorder", "stop")
  if not simRec.on: raise newException(DruidError, "Recorder.stop (simulated): java.lang.IllegalStateException: not recording")
  finishSim("stopped")

proc isRecording*(_: Recorder): bool = bridged(simRec.on): callStatic(bool, "Recorder", "isRecording")

proc amplitude*(_: Recorder): int =
  ## The loudest sample since the last call, 0..32767.
  bridged(if simRec.on: simMicLevel() else: 0): callStatic(int, "Recorder", "amplitude")

# ---- text to speech ----

var simTts {.threadvar.}: tuple[open, ready: bool, language: string]
var nextUtterance {.threadvar.}: int

proc open*(_: Tts) =
  ## Starts the engine; a `tsReady` event says when it can speak.
  if druidStarted():
    callStatic(void, "Tts", "open")
    return
  if not simTts.open:
    simTts = (true, true, "en-US")
    postLocal encodeEvent("tts", "ready", "", 0)

proc isReady*(_: Tts): bool = bridged(simTts.ready): callStatic(bool, "Tts", "isReady")

proc notReady() =
  if not simTts.ready:
    raise newException(DruidError, "Tts (simulated): java.lang.IllegalStateException: text to speech is not ready")

proc setLanguage*(_: Tts, languageTag: string): LanguageSupport =
  ## "en-US", "fr-FR", ...: whether the engine can speak it (it switches if so).
  let r = if druidStarted(): callStatic(int, "Tts", "setLanguage", languageTag)
          else:
            notReady()
            let lang = languageTag.split('-')[0].toLowerAscii
            if lang in ["en", "fr", "de", "es", "it"]:
              simTts.language = languageTag
              (if '-' in languageTag: 1 else: 0)
            else: -2
  for x in LanguageSupport:
    if ord(x) == r: return x
  if r > 0: lsVariant else: lsNotSupported

proc speak*(_: Tts, text: string, flush = false, rate = 1.0'f32, pitch = 1.0'f32): string {.discardable.} =
  ## Speaks `text` after what is queued, or instead of it (`flush`). Returns
  ## the utterance's id (its `tts.utteranceId` in the start / done events).
  inc nextUtterance
  result = "u" & $nextUtterance
  if druidStarted():
    if not callStatic(bool, "Tts", "speak", text, result, flush, rate, pitch):
      raise newException(DruidError, "Tts.speak: refused")
    return
  notReady()
  simSpeak(text)
  postLocal encodeEvent("tts", "start", result, 0)
  postLocal encodeEvent("tts", "done", result, 0)

proc isSpeaking*(_: Tts): bool = bridged(false): callStatic(bool, "Tts", "isSpeaking")
proc stop*(_: Tts) =
  if druidStarted(): callStatic(void, "Tts", "stop")
proc close*(_: Tts) =
  ## Frees the engine; `open` again to speak.
  if druidStarted(): callStatic(void, "Tts", "close") else: simTts = (false, false, "")

# ---- speech recognition ----

var simListening {.threadvar.}: bool
var nextSpeech {.threadvar.}: int

proc isAvailable*(_: Recognizer): bool =
  ## Whether the device has a speech recognizer.
  bridged(true): callStatic(bool, "Recognizer", "isAvailable")

proc start*(_: Recognizer, language = "", partial = true): SpeechRequest =
  ## Listens until the speaker stops. `ekSpeech` events: skReady, skPartial
  ## (if `partial`), then skResult (best first) or skError, and skEnd.
  inc nextSpeech
  result = SpeechRequest(id: nextSpeech)
  if druidStarted():
    callStatic(void, "Recognizer", "start", language, partial, result.id)
    return
  requireMic("Recognizer.start")
  let id = result.id
  postLocal encodeEvent("speech", id, "ready")
  let heard = simHeard()
  if heard.len == 0:
    postLocal encodeEvent("speech", id, "error", 7)                  # ERROR_NO_MATCH
    return
  if partial: postLocal encodeEvent("speech", id, "partial", heard[0].splitWhitespace()[0])
  postLocal encodeEvent("speech", id, "end")
  postLocal encodeEvent("speech", @[$id, "result"] & heard)
  simulator().setHeard()                                              # heard once

proc stop*(_: Recognizer) =
  ## Stop listening; the result follows.
  if druidStarted(): callStatic(void, "Recognizer", "stop")
proc cancel*(_: Recognizer) =
  ## Stop without a result.
  if druidStarted(): callStatic(void, "Recognizer", "cancel") else: simListening = false
proc isListening*(_: Recognizer): bool = bridged(simListening): callStatic(bool, "Recognizer", "isListening")
