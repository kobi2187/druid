import jnim

jclass android.os.CombinedVibration* of JVMObject:
  proc createParallel*(effect: VibrationEffect): CombinedVibration {.`static`.}
  proc startParallel*(): ParallelCombination {.`static`.}
  proc startSequential*(): SequentialCombination {.`static`.}
  proc describeContents*(): jint
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc toDebugString*(): string
  CREATOR*: Parcelable.Creator[CombinedVibration] {.`static`.}

jclass android.os.CombinedVibration.ParallelCombination* of JVMObject:
  proc addVibrator*(vibratorId: jint, effect: VibrationEffect): ParallelCombination
  proc combine*(): CombinedVibration

jclass android.os.CombinedVibration.SequentialCombination* of JVMObject:
  proc addNext*(vibratorId: jint, effect: VibrationEffect): SequentialCombination
  proc addNext*(vibratorId: jint, effect: VibrationEffect, delay: jint): SequentialCombination
  proc addNext*(effect: CombinedVibration): SequentialCombination
  proc addNext*(effect: CombinedVibration, delay: jint): SequentialCombination
  proc combine*(): CombinedVibration

jclass android.os.CombinedVibration.Mono* of JVMObject:
  proc getEffect*(): VibrationEffect
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toDebugString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.os.CombinedVibration.Stereo* of JVMObject:
  proc getEffects*(): SparseArray[VibrationEffect]
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toDebugString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.os.CombinedVibration.Sequential* of JVMObject:
  proc getEffects*(): List[CombinedVibration]
  proc getDelays*(): List[Integer]
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toDebugString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)


jclass android.os.ParallelCombination* of JVMObject:
  proc addVibrator*(vibratorId: jint, effect: VibrationEffect): ParallelCombination
  proc combine*(): CombinedVibration

jclass android.os.SequentialCombination* of JVMObject:
  proc addNext*(vibratorId: jint, effect: VibrationEffect): SequentialCombination
  proc addNext*(vibratorId: jint, effect: VibrationEffect, delay: jint): SequentialCombination
  proc addNext*(effect: CombinedVibration): SequentialCombination
  proc addNext*(effect: CombinedVibration, delay: jint): SequentialCombination
  proc combine*(): CombinedVibration

jclass android.os.Mono* of CombinedVibration:
  proc getEffect*(): VibrationEffect
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toDebugString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Mono] {.`static`.}

jclass android.os.Stereo* of CombinedVibration:
  proc getEffects*(): SparseArray[VibrationEffect]
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toDebugString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Stereo] {.`static`.}

jclass android.os.Sequential* of CombinedVibration:
  proc getEffects*(): List[CombinedVibration]
  proc getDelays*(): List[Integer]
  proc getDuration*(): jlong
  proc getDuration*(vibratorInfos: SparseArray[VibratorInfo]): jlong
  proc isHapticFeedbackCandidate*(): jboolean
  proc validate*()
  proc transform*(transformation: VibrationEffect.Transformation[ParamT], param: ParamT): CombinedVibration
  proc adapt*(adapter: VibratorAdapter): CombinedVibration
  proc hasVibrator*(vibratorId: jint): jboolean
  proc hasVendorEffects*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toDebugString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Sequential] {.`static`.}

