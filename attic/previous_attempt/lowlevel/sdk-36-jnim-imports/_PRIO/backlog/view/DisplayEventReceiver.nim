import jnim

jclass android.view.DisplayEventReceiver* of JVMObject:
  proc dispose*()
  proc onVsync*(timestampNanos: jlong, physicalDisplayId: jlong, frame: jint, vsyncEventData: VsyncEventData)
  proc onHotplug*(timestampNanos: jlong, physicalDisplayId: jlong, connected: jboolean)
  proc onHotplugConnectionError*(timestampNanos: jlong, connectionError: jint)
  proc onModeChanged*(timestampNanos: jlong, physicalDisplayId: jlong, modeId: jint, renderPeriod: jlong)
  proc onModeRejected*(physicalDisplayId: jlong, modeId: jint)
  proc onHdcpLevelsChanged*(physicalDisplayId: jlong, connectedLevel: jint, maxLevel: jint)
  proc onFrameRateOverridesChanged*(timestampNanos: jlong, physicalDisplayId: jlong, overrides: seq[FrameRateOverride])
  proc scheduleVsync*()
  VSYNC_SOURCE_APP*: jint {.`static`.}
  VSYNC_SOURCE_SURFACE_FLINGER*: jint {.`static`.}
  EVENT_REGISTRATION_MODE_CHANGED_FLAG*: jint {.`static`.}
  EVENT_REGISTRATION_FRAME_RATE_OVERRIDE_FLAG*: jint {.`static`.}

jclass android.view.DisplayEventReceiver.VsyncEventData* of JVMObject:
  proc preferredFrameTimeline*(): FrameTimeline

jclass android.view.DisplayEventReceiver.FrameRateOverride* of JVMObject:
  proc toString*(): string

jclass android.view.VsyncEventData* of JVMObject:
  proc preferredFrameTimeline*(): FrameTimeline
  frameInterval*: jlong
  frameTimelines*: FrameTimeline
  preferredFrameTimelineIndex*: jint
  frameTimelinesLength*: jint
  numberQueuedBuffers*: jint

jclass android.view.FrameTimeline* of JVMObject:
  vsyncId*: jlong
  expectedPresentationTime*: jlong
  deadline*: jlong

jclass android.view.FrameRateOverride* of JVMObject:
  proc toString*(): string
  uid*: jint
  frameRateHz*: jfloat

