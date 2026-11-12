import jnim

jclass android.hardware.CameraStreamStats* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getFormat*(): jint
  proc getMaxPreviewFps*(): jfloat
  proc getDataSpace*(): jint
  proc getUsage*(): jlong
  proc getRequestCount*(): jlong
  proc getErrorCount*(): jlong
  proc getStartLatencyMs*(): jint
  proc getMaxHalBuffers*(): jint
  proc getMaxAppBuffers*(): jint
  proc getHistogramType*(): jint
  proc getHistogramBins*(): seq[jfloat]
  proc getHistogramCounts*(): seq[jlong]
  proc getDynamicRangeProfile*(): jlong
  proc getColorSpace*(): jint
  proc getStreamUseCase*(): jlong
  HISTOGRAM_TYPE_UNKNOWN*: jint {.`static`.}
  HISTOGRAM_TYPE_CAPTURE_LATENCY*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CameraStreamStats] {.`static`.}

