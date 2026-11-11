import jnim

jclass android.apex.IApexService* of IInterface:
  proc submitStagedSession*(params: android.apex.ApexSessionParams, packages: android.apex.ApexInfoList)
  proc markStagedSessionReady*(session_id: jint)
  proc markStagedSessionSuccessful*(session_id: jint)
  proc getSessions*(): seq[android.apex.ApexSessionInfo]
  proc getStagedSessionInfo*(session_id: jint): android.apex.ApexSessionInfo
  proc getStagedApexInfos*(params: android.apex.ApexSessionParams): seq[android.apex.ApexInfo]
  proc getActivePackages*(): seq[android.apex.ApexInfo]
  proc getAllPackages*(): seq[android.apex.ApexInfo]
  proc abortStagedSession*(session_id: jint)
  proc revertActiveSessions*()
  proc snapshotCeData*(user_id: jint, rollback_id: jint, apex_name: string)
  proc restoreCeData*(user_id: jint, rollback_id: jint, apex_name: string)
  proc destroyDeSnapshots*(rollback_id: jint)
  proc destroyCeSnapshots*(user_id: jint, rollback_id: jint)
  proc destroyCeSnapshotsNotSpecified*(user_id: jint, retain_rollback_ids: seq[jint])
  proc unstagePackages*(active_package_paths: java.util.List[string])
  proc stagePackages*(package_tmp_paths: java.util.List[string])
  proc resumeRevertIfNeeded*()
  proc recollectPreinstalledData*()
  proc markBootCompleted*()
  proc calculateSizeForCompressedApex*(compressed_apex_info_list: android.apex.CompressedApexInfoList): jlong
  proc reserveSpaceForCompressedApex*(compressed_apex_info_list: android.apex.CompressedApexInfoList)
  proc installAndActivatePackage*(packagePath: string, force: jboolean): android.apex.ApexInfo
  DESCRIPTOR*: string {.`static`.}

jclass android.apex.IApexService.Default* of JVMObject:
  proc submitStagedSession*(params: android.apex.ApexSessionParams, packages: android.apex.ApexInfoList)
  proc markStagedSessionReady*(session_id: jint)
  proc markStagedSessionSuccessful*(session_id: jint)
  proc getSessions*(): seq[android.apex.ApexSessionInfo]
  proc getStagedSessionInfo*(session_id: jint): android.apex.ApexSessionInfo
  proc getStagedApexInfos*(params: android.apex.ApexSessionParams): seq[android.apex.ApexInfo]
  proc getActivePackages*(): seq[android.apex.ApexInfo]
  proc getAllPackages*(): seq[android.apex.ApexInfo]
  proc abortStagedSession*(session_id: jint)
  proc revertActiveSessions*()
  proc snapshotCeData*(user_id: jint, rollback_id: jint, apex_name: string)
  proc restoreCeData*(user_id: jint, rollback_id: jint, apex_name: string)
  proc destroyDeSnapshots*(rollback_id: jint)
  proc destroyCeSnapshots*(user_id: jint, rollback_id: jint)
  proc destroyCeSnapshotsNotSpecified*(user_id: jint, retain_rollback_ids: seq[jint])
  proc unstagePackages*(active_package_paths: java.util.List[string])
  proc stagePackages*(package_tmp_paths: java.util.List[string])
  proc resumeRevertIfNeeded*()
  proc recollectPreinstalledData*()
  proc markBootCompleted*()
  proc calculateSizeForCompressedApex*(compressed_apex_info_list: android.apex.CompressedApexInfoList): jlong
  proc reserveSpaceForCompressedApex*(compressed_apex_info_list: android.apex.CompressedApexInfoList)
  proc installAndActivatePackage*(packagePath: string, force: jboolean): android.apex.ApexInfo
  proc asBinder*(): android.os.IBinder

jclass android.apex.IApexService.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.apex.IApexService {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.apex.Default* of JVMObject:
  proc submitStagedSession*(params: android.apex.ApexSessionParams, packages: android.apex.ApexInfoList)
  proc markStagedSessionReady*(session_id: jint)
  proc markStagedSessionSuccessful*(session_id: jint)
  proc getSessions*(): seq[android.apex.ApexSessionInfo]
  proc getStagedSessionInfo*(session_id: jint): android.apex.ApexSessionInfo
  proc getStagedApexInfos*(params: android.apex.ApexSessionParams): seq[android.apex.ApexInfo]
  proc getActivePackages*(): seq[android.apex.ApexInfo]
  proc getAllPackages*(): seq[android.apex.ApexInfo]
  proc abortStagedSession*(session_id: jint)
  proc revertActiveSessions*()
  proc snapshotCeData*(user_id: jint, rollback_id: jint, apex_name: string)
  proc restoreCeData*(user_id: jint, rollback_id: jint, apex_name: string)
  proc destroyDeSnapshots*(rollback_id: jint)
  proc destroyCeSnapshots*(user_id: jint, rollback_id: jint)
  proc destroyCeSnapshotsNotSpecified*(user_id: jint, retain_rollback_ids: seq[jint])
  proc unstagePackages*(active_package_paths: java.util.List[string])
  proc stagePackages*(package_tmp_paths: java.util.List[string])
  proc resumeRevertIfNeeded*()
  proc recollectPreinstalledData*()
  proc markBootCompleted*()
  proc calculateSizeForCompressedApex*(compressed_apex_info_list: android.apex.CompressedApexInfoList): jlong
  proc reserveSpaceForCompressedApex*(compressed_apex_info_list: android.apex.CompressedApexInfoList)
  proc installAndActivatePackage*(packagePath: string, force: jboolean): android.apex.ApexInfo
  proc asBinder*(): android.os.IBinder

jclass android.apex.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.apex.IApexService {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

