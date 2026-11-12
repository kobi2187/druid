import jnim

jclass android.os.Debug* of JVMObject:
  proc suspendAllAndSendVmStart*() {.`static`.}
  proc waitForDebugger*() {.`static`.}
  proc waitingForDebugger*(): jboolean {.`static`.}
  proc isDebuggerConnected*(): jboolean {.`static`.}
  proc getVmFeatureList*(): seq[string] {.`static`.}
  proc getFeatureList*(): seq[string] {.`static`.}
  proc changeDebugPort*(port: jint) {.`static`.}
  proc startNativeTracing*() {.`static`.}
  proc stopNativeTracing*() {.`static`.}
  proc enableEmulatorTraceOutput*() {.`static`.}
  proc startMethodTracing*() {.`static`.}
  proc startMethodTracing*(tracePath: string) {.`static`.}
  proc startMethodTracing*(tracePath: string, bufferSize: jint) {.`static`.}
  proc startMethodTracing*(tracePath: string, bufferSize: jint, flags: jint) {.`static`.}
  proc startMethodTracingSampling*(tracePath: string, bufferSize: jint, intervalUs: jint) {.`static`.}
  proc startMethodTracing*(traceName: string, fd: FileDescriptor, bufferSize: jint, flags: jint, streamOutput: jboolean) {.`static`.}
  proc startMethodTracingDdms*(bufferSize: jint, flags: jint, samplingEnabled: jboolean, intervalUs: jint) {.`static`.}
  proc getMethodTracingMode*(): jint {.`static`.}
  proc stopMethodTracing*() {.`static`.}
  proc threadCpuTimeNanos*(): jlong {.`static`.}
  proc startAllocCounting*() {.`static`.}
  proc stopAllocCounting*() {.`static`.}
  proc getGlobalAllocCount*(): jint {.`static`.}
  proc resetGlobalAllocCount*() {.`static`.}
  proc getGlobalAllocSize*(): jint {.`static`.}
  proc resetGlobalAllocSize*() {.`static`.}
  proc getGlobalFreedCount*(): jint {.`static`.}
  proc resetGlobalFreedCount*() {.`static`.}
  proc getGlobalFreedSize*(): jint {.`static`.}
  proc resetGlobalFreedSize*() {.`static`.}
  proc getGlobalGcInvocationCount*(): jint {.`static`.}
  proc resetGlobalGcInvocationCount*() {.`static`.}
  proc getGlobalClassInitCount*(): jint {.`static`.}
  proc resetGlobalClassInitCount*() {.`static`.}
  proc getGlobalClassInitTime*(): jint {.`static`.}
  proc resetGlobalClassInitTime*() {.`static`.}
  proc getGlobalExternalAllocCount*(): jint {.`static`.}
  proc resetGlobalExternalAllocSize*() {.`static`.}
  proc resetGlobalExternalAllocCount*() {.`static`.}
  proc getGlobalExternalAllocSize*(): jint {.`static`.}
  proc getGlobalExternalFreedCount*(): jint {.`static`.}
  proc resetGlobalExternalFreedCount*() {.`static`.}
  proc getGlobalExternalFreedSize*(): jint {.`static`.}
  proc resetGlobalExternalFreedSize*() {.`static`.}
  proc getThreadAllocCount*(): jint {.`static`.}
  proc resetThreadAllocCount*() {.`static`.}
  proc getThreadAllocSize*(): jint {.`static`.}
  proc resetThreadAllocSize*() {.`static`.}
  proc getThreadExternalAllocCount*(): jint {.`static`.}
  proc resetThreadExternalAllocCount*() {.`static`.}
  proc getThreadExternalAllocSize*(): jint {.`static`.}
  proc resetThreadExternalAllocSize*() {.`static`.}
  proc getThreadGcInvocationCount*(): jint {.`static`.}
  proc resetThreadGcInvocationCount*() {.`static`.}
  proc resetAllCounts*() {.`static`.}
  proc getRuntimeStat*(statName: string): string {.`static`.}
  proc getRuntimeStats*(): Map[string, string] {.`static`.}
  proc getNativeHeapSize*(): jlong {.`static`.}
  proc getNativeHeapAllocatedSize*(): jlong {.`static`.}
  proc getNativeHeapFreeSize*(): jlong {.`static`.}
  proc getMemoryInfo*(memoryInfo: MemoryInfo) {.`static`.}
  proc getMemoryInfo*(pid: jint, memoryInfo: MemoryInfo): jboolean {.`static`.}
  proc getPss*(): jlong {.`static`.}
  proc getPss*(pid: jint, outUssSwapPssRss: seq[jlong], outMemtrack: seq[jlong]): jlong {.`static`.}
  proc getRss*(): jlong {.`static`.}
  proc getRss*(pid: jint, outMemtrack: seq[jlong]): jlong {.`static`.}
  proc getMemInfo*(outSizes: seq[jlong]) {.`static`.}
  proc setAllocationLimit*(limit: jint): jint {.`static`.}
  proc setGlobalAllocationLimit*(limit: jint): jint {.`static`.}
  proc printLoadedClasses*(flags: jint) {.`static`.}
  proc getLoadedClassCount*(): jint {.`static`.}
  proc dumpHprofData*(fileName: string) {.`static`.}
  proc dumpHprofData*(fileName: string, fd: FileDescriptor) {.`static`.}
  proc dumpHprofData*(fileName: string, bitmapFormat: string) {.`static`.}
  proc dumpHprofData*(fileName: string, fd: FileDescriptor, bitmapFormat: string) {.`static`.}
  proc dumpHprofDataDdms*() {.`static`.}
  proc dumpNativeHeap*(fd: FileDescriptor) {.`static`.}
  proc dumpNativeMallocInfo*(fd: FileDescriptor) {.`static`.}
  proc countInstancesOfClass*(cls: Class): jlong {.`static`.}
  proc getBinderSentTransactions*(): jint {.`static`.}
  proc getBinderReceivedTransactions*(): jint {.`static`.}
  proc getBinderLocalObjectCount*(): jint {.`static`.}
  proc getBinderProxyObjectCount*(): jint {.`static`.}
  proc getBinderDeathObjectCount*(): jint {.`static`.}
  proc dumpReferenceTables*() {.`static`.}
  proc setFieldsOn*(cl: Class[?]) {.`static`.}
  proc setFieldsOn*(cl: Class[?], partial: jboolean) {.`static`.}
  proc dumpService*(name: string, fd: FileDescriptor, args: seq[string]): jboolean {.`static`.}
  proc dumpJavaBacktraceToFileTimeout*(pid: jint, file: string, timeoutSecs: jint): jboolean {.`static`.}
  proc dumpNativeBacktraceToFileTimeout*(pid: jint, file: string, timeoutSecs: jint): jboolean {.`static`.}
  proc getUnreachableMemory*(limit: jint, contents: jboolean): string {.`static`.}
  proc getCallers*(depth: jint): string {.`static`.}
  proc getCallers*(start: jint, depth: jint): string {.`static`.}
  proc getCallers*(depth: jint, linePrefix: string): string {.`static`.}
  proc getCaller*(): string {.`static`.}
  proc attachJvmtiAgent*(library: string, options: string, classLoader: ClassLoader) {.`static`.}
  proc getZramFreeKb*(): jlong {.`static`.}
  proc getDmabufTotalExportedKb*(): jlong {.`static`.}
  proc getDmabufHeapTotalExportedKb*(): jlong {.`static`.}
  proc getIonHeapsSizeKb*(): jlong {.`static`.}
  proc getDmabufHeapPoolsSizeKb*(): jlong {.`static`.}
  proc getIonPoolsSizeKb*(): jlong {.`static`.}
  proc getGpuPrivateMemoryKb*(): jlong {.`static`.}
  proc getDmabufMappedSizeKb*(): jlong {.`static`.}
  proc getGpuTotalUsageKb*(): jlong {.`static`.}
  proc isVmapStack*(): jboolean {.`static`.}
  proc logAllocatorStats*(): jboolean {.`static`.}
  proc getKernelCmaUsageKb*(): jlong {.`static`.}
  TRACE_COUNT_ALLOCS*: jint {.`static`.}
  SHOW_FULL_DETAIL*: jint {.`static`.}
  SHOW_CLASSLOADER*: jint {.`static`.}
  SHOW_INITIALIZED*: jint {.`static`.}
  MEMINFO_TOTAL*: jint {.`static`.}
  MEMINFO_FREE*: jint {.`static`.}
  MEMINFO_BUFFERS*: jint {.`static`.}
  MEMINFO_CACHED*: jint {.`static`.}
  MEMINFO_SHMEM*: jint {.`static`.}
  MEMINFO_SLAB*: jint {.`static`.}
  MEMINFO_SLAB_RECLAIMABLE*: jint {.`static`.}
  MEMINFO_SLAB_UNRECLAIMABLE*: jint {.`static`.}
  MEMINFO_SWAP_TOTAL*: jint {.`static`.}
  MEMINFO_SWAP_FREE*: jint {.`static`.}
  MEMINFO_ZRAM_TOTAL*: jint {.`static`.}
  MEMINFO_MAPPED*: jint {.`static`.}
  MEMINFO_VM_ALLOC_USED*: jint {.`static`.}
  MEMINFO_PAGE_TABLES*: jint {.`static`.}
  MEMINFO_KERNEL_STACK*: jint {.`static`.}
  MEMINFO_KRECLAIMABLE*: jint {.`static`.}
  MEMINFO_ACTIVE*: jint {.`static`.}
  MEMINFO_INACTIVE*: jint {.`static`.}
  MEMINFO_UNEVICTABLE*: jint {.`static`.}
  MEMINFO_AVAILABLE*: jint {.`static`.}
  MEMINFO_ACTIVE_ANON*: jint {.`static`.}
  MEMINFO_INACTIVE_ANON*: jint {.`static`.}
  MEMINFO_ACTIVE_FILE*: jint {.`static`.}
  MEMINFO_INACTIVE_FILE*: jint {.`static`.}
  MEMINFO_CMA_TOTAL*: jint {.`static`.}
  MEMINFO_CMA_FREE*: jint {.`static`.}
  MEMINFO_COUNT*: jint {.`static`.}

jclass android.os.Debug.MemoryInfo* of JVMObject:
  proc set*(other: MemoryInfo)
  proc getTotalPss*(): jint
  proc getTotalUss*(): jint
  proc getTotalSwappablePss*(): jint
  proc getTotalRss*(): jint
  proc getTotalPrivateDirty*(): jint
  proc getTotalSharedDirty*(): jint
  proc getTotalPrivateClean*(): jint
  proc getTotalSharedClean*(): jint
  proc getTotalSwappedOut*(): jint
  proc getTotalSwappedOutPss*(): jint
  proc getOtherPss*(which: jint): jint
  proc getOtherSwappablePss*(which: jint): jint
  proc getOtherRss*(which: jint): jint
  proc getOtherPrivateDirty*(which: jint): jint
  proc getOtherSharedDirty*(which: jint): jint
  proc getOtherPrivateClean*(which: jint): jint
  proc getOtherPrivate*(which: jint): jint
  proc getOtherSharedClean*(which: jint): jint
  proc getOtherSwappedOut*(which: jint): jint
  proc getOtherSwappedOutPss*(which: jint): jint
  proc getOtherLabel*(which: jint): string {.`static`.}
  proc getMemoryStat*(statName: string): string
  proc getMemoryStats*(): Map[string, string]
  proc getSummaryJavaHeap*(): jint
  proc getSummaryNativeHeap*(): jint
  proc getSummaryCode*(): jint
  proc getSummaryStack*(): jint
  proc getSummaryGraphics*(): jint
  proc getSummaryPrivateOther*(): jint
  proc getSummarySystem*(): jint
  proc getSummaryJavaHeapRss*(): jint
  proc getSummaryNativeHeapRss*(): jint
  proc getSummaryCodeRss*(): jint
  proc getSummaryStackRss*(): jint
  proc getSummaryGraphicsRss*(): jint
  proc getSummaryUnknownRss*(): jint
  proc getSummaryTotalPss*(): jint
  proc getSummaryTotalSwap*(): jint
  proc getSummaryTotalSwapPss*(): jint
  proc hasSwappedOutPss*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)

jclass android.os.Debug.InstructionCount* of JVMObject:
  proc resetAndStart*(): jboolean
  proc collect*(): jboolean
  proc globalTotal*(): jint
  proc globalMethodInvocations*(): jint

jclass android.os.MemoryInfo* of JVMObject:
  proc set*(other: MemoryInfo)
  proc getTotalPss*(): jint
  proc getTotalUss*(): jint
  proc getTotalSwappablePss*(): jint
  proc getTotalRss*(): jint
  proc getTotalPrivateDirty*(): jint
  proc getTotalSharedDirty*(): jint
  proc getTotalPrivateClean*(): jint
  proc getTotalSharedClean*(): jint
  proc getTotalSwappedOut*(): jint
  proc getTotalSwappedOutPss*(): jint
  proc getOtherPss*(which: jint): jint
  proc getOtherSwappablePss*(which: jint): jint
  proc getOtherRss*(which: jint): jint
  proc getOtherPrivateDirty*(which: jint): jint
  proc getOtherSharedDirty*(which: jint): jint
  proc getOtherPrivateClean*(which: jint): jint
  proc getOtherPrivate*(which: jint): jint
  proc getOtherSharedClean*(which: jint): jint
  proc getOtherSwappedOut*(which: jint): jint
  proc getOtherSwappedOutPss*(which: jint): jint
  proc getOtherLabel*(which: jint): string {.`static`.}
  proc getMemoryStat*(statName: string): string
  proc getMemoryStats*(): Map[string, string]
  proc getSummaryJavaHeap*(): jint
  proc getSummaryNativeHeap*(): jint
  proc getSummaryCode*(): jint
  proc getSummaryStack*(): jint
  proc getSummaryGraphics*(): jint
  proc getSummaryPrivateOther*(): jint
  proc getSummarySystem*(): jint
  proc getSummaryJavaHeapRss*(): jint
  proc getSummaryNativeHeapRss*(): jint
  proc getSummaryCodeRss*(): jint
  proc getSummaryStackRss*(): jint
  proc getSummaryGraphicsRss*(): jint
  proc getSummaryUnknownRss*(): jint
  proc getSummaryTotalPss*(): jint
  proc getSummaryTotalSwap*(): jint
  proc getSummaryTotalSwapPss*(): jint
  proc hasSwappedOutPss*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  dalvikPss*: jint
  dalvikSwappablePss*: jint
  dalvikRss*: jint
  dalvikPrivateDirty*: jint
  dalvikSharedDirty*: jint
  dalvikPrivateClean*: jint
  dalvikSharedClean*: jint
  dalvikSwappedOut*: jint
  dalvikSwappedOutPss*: jint
  nativePss*: jint
  nativeSwappablePss*: jint
  nativeRss*: jint
  nativePrivateDirty*: jint
  nativeSharedDirty*: jint
  nativePrivateClean*: jint
  nativeSharedClean*: jint
  nativeSwappedOut*: jint
  nativeSwappedOutPss*: jint
  otherPss*: jint
  otherSwappablePss*: jint
  otherRss*: jint
  otherPrivateDirty*: jint
  otherSharedDirty*: jint
  otherPrivateClean*: jint
  otherSharedClean*: jint
  otherSwappedOut*: jint
  otherSwappedOutPss*: jint
  hasSwappedOutPss*: jboolean
  HEAP_UNKNOWN*: jint {.`static`.}
  HEAP_DALVIK*: jint {.`static`.}
  HEAP_NATIVE*: jint {.`static`.}
  OTHER_DALVIK_OTHER*: jint {.`static`.}
  OTHER_STACK*: jint {.`static`.}
  OTHER_CURSOR*: jint {.`static`.}
  OTHER_ASHMEM*: jint {.`static`.}
  OTHER_GL_DEV*: jint {.`static`.}
  OTHER_UNKNOWN_DEV*: jint {.`static`.}
  OTHER_SO*: jint {.`static`.}
  OTHER_JAR*: jint {.`static`.}
  OTHER_APK*: jint {.`static`.}
  OTHER_TTF*: jint {.`static`.}
  OTHER_DEX*: jint {.`static`.}
  OTHER_OAT*: jint {.`static`.}
  OTHER_ART*: jint {.`static`.}
  OTHER_UNKNOWN_MAP*: jint {.`static`.}
  OTHER_GRAPHICS*: jint {.`static`.}
  OTHER_GL*: jint {.`static`.}
  OTHER_OTHER_MEMTRACK*: jint {.`static`.}
  NUM_OTHER_STATS*: jint {.`static`.}
  OTHER_DALVIK_NORMAL*: jint {.`static`.}
  OTHER_DALVIK_LARGE*: jint {.`static`.}
  OTHER_DALVIK_ZYGOTE*: jint {.`static`.}
  OTHER_DALVIK_NON_MOVING*: jint {.`static`.}
  OTHER_DVK_STAT_DALVIK_START*: jint {.`static`.}
  OTHER_DVK_STAT_DALVIK_END*: jint {.`static`.}
  OTHER_DALVIK_OTHER_LINEARALLOC*: jint {.`static`.}
  OTHER_DALVIK_OTHER_ACCOUNTING*: jint {.`static`.}
  OTHER_DALVIK_OTHER_ZYGOTE_CODE_CACHE*: jint {.`static`.}
  OTHER_DALVIK_OTHER_APP_CODE_CACHE*: jint {.`static`.}
  OTHER_DALVIK_OTHER_COMPILER_METADATA*: jint {.`static`.}
  OTHER_DALVIK_OTHER_INDIRECT_REFERENCE_TABLE*: jint {.`static`.}
  OTHER_DVK_STAT_DALVIK_OTHER_START*: jint {.`static`.}
  OTHER_DVK_STAT_DALVIK_OTHER_END*: jint {.`static`.}
  OTHER_DEX_BOOT_VDEX*: jint {.`static`.}
  OTHER_DEX_APP_DEX*: jint {.`static`.}
  OTHER_DEX_APP_VDEX*: jint {.`static`.}
  OTHER_DVK_STAT_DEX_START*: jint {.`static`.}
  OTHER_DVK_STAT_DEX_END*: jint {.`static`.}
  OTHER_ART_APP*: jint {.`static`.}
  OTHER_ART_BOOT*: jint {.`static`.}
  OTHER_DVK_STAT_ART_START*: jint {.`static`.}
  OTHER_DVK_STAT_ART_END*: jint {.`static`.}
  NUM_DVK_STATS*: jint {.`static`.}
  NUM_CATEGORIES*: jint {.`static`.}
  OFFSET_PSS*: jint {.`static`.}
  OFFSET_SWAPPABLE_PSS*: jint {.`static`.}
  OFFSET_RSS*: jint {.`static`.}
  OFFSET_PRIVATE_DIRTY*: jint {.`static`.}
  OFFSET_SHARED_DIRTY*: jint {.`static`.}
  OFFSET_PRIVATE_CLEAN*: jint {.`static`.}
  OFFSET_SHARED_CLEAN*: jint {.`static`.}
  OFFSET_SWAPPED_OUT*: jint {.`static`.}
  OFFSET_SWAPPED_OUT_PSS*: jint {.`static`.}
  CREATOR*: Creator[MemoryInfo] {.`static`.}

jclass android.os.InstructionCount* of JVMObject:
  proc resetAndStart*(): jboolean
  proc collect*(): jboolean
  proc globalTotal*(): jint
  proc globalMethodInvocations*(): jint

