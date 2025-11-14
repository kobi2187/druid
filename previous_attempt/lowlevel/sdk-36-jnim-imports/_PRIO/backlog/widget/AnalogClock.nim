import jnim

jclass android.widget.AnalogClock* of View:
  proc setDial*(icon: Icon)
  proc setDialTintList*(tint: ColorStateList)
  proc getDialTintList*(): ColorStateList
  proc setDialTintBlendMode*(blendMode: BlendMode)
  proc getDialTintBlendMode*(): BlendMode
  proc setHourHand*(icon: Icon)
  proc setHourHandTintList*(tint: ColorStateList)
  proc getHourHandTintList*(): ColorStateList
  proc setHourHandTintBlendMode*(blendMode: BlendMode)
  proc getHourHandTintBlendMode*(): BlendMode
  proc setMinuteHand*(icon: Icon)
  proc setMinuteHandTintList*(tint: ColorStateList)
  proc getMinuteHandTintList*(): ColorStateList
  proc setMinuteHandTintBlendMode*(blendMode: BlendMode)
  proc getMinuteHandTintBlendMode*(): BlendMode
  proc setSecondHand*(icon: Icon)
  proc setSecondHandTintList*(tint: ColorStateList)
  proc getSecondHandTintList*(): ColorStateList
  proc setSecondHandTintBlendMode*(blendMode: BlendMode)
  proc getSecondHandTintBlendMode*(): BlendMode
  proc getTimeZone*(): string
  proc setTimeZone*(timeZone: string)
  proc onVisibilityAggregated*(isVisible: jboolean)
  proc setClockEventDelegate*(delegate: ClockEventDelegate)

