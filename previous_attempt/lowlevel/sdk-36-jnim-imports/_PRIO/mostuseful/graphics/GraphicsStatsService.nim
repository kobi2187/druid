import jnim

jclass android.graphics.GraphicsStatsService* of Stub:
  proc requestBufferForProcess*(packageName: string, token: IGraphicsStatsCallback): ParcelFileDescriptor
  GRAPHICS_STATS_SERVICE*: string {.`static`.}

