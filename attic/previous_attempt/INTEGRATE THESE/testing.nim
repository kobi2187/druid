
type AudioBuffer = object
    discard
type AndroidFeature = enum
    afAudio, afNone
## Global Feature Tracking (Compile-Time)
var usedFeatures {.compileTime.}: set[AndroidFeature]
var needsContext {.compileTime.}: bool = false

template trackFeature(feature: AndroidFeature, requiresContext: bool = false) =
  static:
    usedFeatures.incl(feature)
    if requiresContext:
      needsContext = true

## Friction-Free API - Users Just Write Normal Code
proc playAudio*(buffer: AudioBuffer) =
  echo "entering playAudio"
  trackFeature(afAudio)  # Automatically tracked
  # Implementation chosen at runtime
  echo "exiting playAudio"

var features : set[AndroidFeature]

proc main() =
  echo "begin!"
  echo features.len
  var b: AudioBuffer
  b.playAudio()

  when afAudio in usedFeatures:
    echo "playAudio was called!"
  else:
    echo "not using playAudio or feature tracking broken."
  echo "end.."
main()

## IT WORKS!!