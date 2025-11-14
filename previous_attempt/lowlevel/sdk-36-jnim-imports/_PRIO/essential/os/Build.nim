import jnim

jclass android.os.Build* of JVMObject:
  proc getSerial*(): string {.`static`.}
  proc is64BitAbi*(abi: string): jboolean {.`static`.}
  proc getMajorSdkVersion*(sdkIntFull: jint): jint {.`static`.}
  proc getMinorSdkVersion*(sdkIntFull: jint): jint {.`static`.}
  proc parseFullVersion*(version: string): jint {.`static`.}
  proc fullVersionToString*(version: jint): string {.`static`.}
  proc getBackportedFixStatus*(id: jlong): jint {.`static`.}
  proc ensureFingerprintProperty*() {.`static`.}
  proc isBuildConsistent*(): jboolean {.`static`.}
  proc getFingerprintedPartitions*(): List[Partition] {.`static`.}
  proc isDebuggable*(): jboolean {.`static`.}
  proc getRadioVersion*(): string {.`static`.}
  UNKNOWN*: string {.`static`.}
  ID*: string {.`static`.}
  DISPLAY*: string {.`static`.}
  PRODUCT*: string {.`static`.}
  PRODUCT_FOR_ATTESTATION*: string {.`static`.}
  DEVICE*: string {.`static`.}
  DEVICE_FOR_ATTESTATION*: string {.`static`.}
  BOARD*: string {.`static`.}
  CPU_ABI*: string {.`static`.}
  CPU_ABI2*: string {.`static`.}
  MANUFACTURER*: string {.`static`.}
  MANUFACTURER_FOR_ATTESTATION*: string {.`static`.}
  BRAND*: string {.`static`.}
  BRAND_FOR_ATTESTATION*: string {.`static`.}
  MODEL*: string {.`static`.}
  MODEL_FOR_ATTESTATION*: string {.`static`.}
  SOC_MANUFACTURER*: string {.`static`.}
  SOC_MODEL*: string {.`static`.}
  BOOTLOADER*: string {.`static`.}
  RADIO*: string {.`static`.}
  HARDWARE*: string {.`static`.}
  SKU*: string {.`static`.}
  ODM_SKU*: string {.`static`.}
  IS_EMULATOR*: jboolean {.`static`.}
  SERIAL*: string {.`static`.}
  SUPPORTED_ABIS*: string {.`static`.}
  SUPPORTED_32_BIT_ABIS*: string {.`static`.}
  SUPPORTED_64_BIT_ABIS*: string {.`static`.}
  VENDOR_API_2024_Q2*: jint {.`static`.}
  TYP*: string {.`static`.}
  TAGS*: string {.`static`.}
  FINGERPRINT*: string {.`static`.}
  BACKPORTED_FIX_STATUS_UNKNOWN*: jint {.`static`.}
  BACKPORTED_FIX_STATUS_FIXED*: jint {.`static`.}
  BACKPORTED_FIX_STATUS_NOT_APPLICABLE*: jint {.`static`.}
  BACKPORTED_FIX_STATUS_NOT_FIXED*: jint {.`static`.}
  HW_TIMEOUT_MULTIPLIER*: jint {.`static`.}
  IS_TREBLE_ENABLED*: jboolean {.`static`.}
  TIME*: jlong {.`static`.}
  USER*: string {.`static`.}
  HOST*: string {.`static`.}
  IS_DEBUGGABLE*: jboolean {.`static`.}
  IS_ENG*: jboolean {.`static`.}
  IS_USERDEBUG*: jboolean {.`static`.}
  IS_USER*: jboolean {.`static`.}
  IS_ARC*: jboolean {.`static`.}
  PERMISSIONS_REVIEW_REQUIRED*: jboolean {.`static`.}

jclass android.os.Build.Partition* of JVMObject:
  proc getName*(): string
  proc getFingerprint*(): string
  proc getBuildTimeMillis*(): jlong
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.os.VERSION* of JVMObject:
  INCREMENTAL*: string {.`static`.}
  RELEASE*: string {.`static`.}
  RELEASE_OR_CODENAME*: string {.`static`.}
  RELEASE_OR_PREVIEW_DISPLAY*: string {.`static`.}
  BASE_OS*: string {.`static`.}
  SECURITY_PATCH*: string {.`static`.}
  MEDIA_PERFORMANCE_CLASS*: jint {.`static`.}
  SDK*: string {.`static`.}
  SDK_INT*: jint {.`static`.}
  SDK_INT_FULL*: jint {.`static`.}
  DEVICE_INITIAL_SDK_INT*: jint {.`static`.}
  PREVIEW_SDK_INT*: jint {.`static`.}
  PREVIEW_SDK_FINGERPRINT*: string {.`static`.}
  CODENAME*: string {.`static`.}
  KNOWN_CODENAMES*: Set[string] {.`static`.}
  ACTIVE_CODENAMES*: string {.`static`.}
  RESOURCES_SDK_INT*: jint {.`static`.}
  MIN_SUPPORTED_TARGET_SDK_INT*: jint {.`static`.}

jclass android.os.VERSION_CODES* of JVMObject:
  CUR_DEVELOPMENT*: jint {.`static`.}
  BASE*: jint {.`static`.}
  BASE_1_1*: jint {.`static`.}
  CUPCAKE*: jint {.`static`.}
  DONUT*: jint {.`static`.}
  ECLAIR*: jint {.`static`.}
  ECLAIR_0_1*: jint {.`static`.}
  ECLAIR_MR1*: jint {.`static`.}
  FROYO*: jint {.`static`.}
  GINGERBREAD*: jint {.`static`.}
  GINGERBREAD_MR1*: jint {.`static`.}
  HONEYCOMB*: jint {.`static`.}
  HONEYCOMB_MR1*: jint {.`static`.}
  HONEYCOMB_MR2*: jint {.`static`.}
  ICE_CREAM_SANDWICH*: jint {.`static`.}
  ICE_CREAM_SANDWICH_MR1*: jint {.`static`.}
  JELLY_BEAN*: jint {.`static`.}
  JELLY_BEAN_MR1*: jint {.`static`.}
  JELLY_BEAN_MR2*: jint {.`static`.}
  KITKAT*: jint {.`static`.}
  KITKAT_WATCH*: jint {.`static`.}
  L*: jint {.`static`.}
  LOLLIPOP*: jint {.`static`.}
  LOLLIPOP_MR1*: jint {.`static`.}
  M*: jint {.`static`.}
  N*: jint {.`static`.}
  N_MR1*: jint {.`static`.}
  O*: jint {.`static`.}
  O_MR1*: jint {.`static`.}
  P*: jint {.`static`.}
  Q*: jint {.`static`.}
  R*: jint {.`static`.}
  S*: jint {.`static`.}
  S_V2*: jint {.`static`.}
  TIRAMISU*: jint {.`static`.}
  UPSIDE_DOWN_CAKE*: jint {.`static`.}
  VANILLA_ICE_CREAM*: jint {.`static`.}
  BAKLAVA*: jint {.`static`.}

jclass android.os.VERSION_CODES_FULL* of JVMObject:
  BASE*: jint {.`static`.}
  BASE_1_1*: jint {.`static`.}
  CUPCAKE*: jint {.`static`.}
  DONUT*: jint {.`static`.}
  ECLAIR*: jint {.`static`.}
  ECLAIR_0_1*: jint {.`static`.}
  ECLAIR_MR1*: jint {.`static`.}
  FROYO*: jint {.`static`.}
  GINGERBREAD*: jint {.`static`.}
  GINGERBREAD_MR1*: jint {.`static`.}
  HONEYCOMB*: jint {.`static`.}
  HONEYCOMB_MR1*: jint {.`static`.}
  HONEYCOMB_MR2*: jint {.`static`.}
  ICE_CREAM_SANDWICH*: jint {.`static`.}
  ICE_CREAM_SANDWICH_MR1*: jint {.`static`.}
  JELLY_BEAN*: jint {.`static`.}
  JELLY_BEAN_MR1*: jint {.`static`.}
  JELLY_BEAN_MR2*: jint {.`static`.}
  KITKAT*: jint {.`static`.}
  KITKAT_WATCH*: jint {.`static`.}
  LOLLIPOP*: jint {.`static`.}
  LOLLIPOP_MR1*: jint {.`static`.}
  M*: jint {.`static`.}
  N*: jint {.`static`.}
  N_MR1*: jint {.`static`.}
  O*: jint {.`static`.}
  O_MR1*: jint {.`static`.}
  P*: jint {.`static`.}
  Q*: jint {.`static`.}
  R*: jint {.`static`.}
  S*: jint {.`static`.}
  S_V2*: jint {.`static`.}
  TIRAMISU*: jint {.`static`.}
  UPSIDE_DOWN_CAKE*: jint {.`static`.}
  VANILLA_ICE_CREAM*: jint {.`static`.}
  BAKLAVA*: jint {.`static`.}

jclass android.os.Partition* of JVMObject:
  proc getName*(): string
  proc getFingerprint*(): string
  proc getBuildTimeMillis*(): jlong
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  PARTITION_NAME_SYSTEM*: string {.`static`.}
  PARTITION_NAME_BOOTIMAGE*: string {.`static`.}
  PARTITION_NAME_ODM*: string {.`static`.}
  PARTITION_NAME_OEM*: string {.`static`.}
  PARTITION_NAME_PRODUCT*: string {.`static`.}
  PARTITION_NAME_SYSTEM_EXT*: string {.`static`.}
  PARTITION_NAME_VENDOR*: string {.`static`.}

