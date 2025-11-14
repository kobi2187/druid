import jnim

jclass android.app.JobSchedulerImpl* of JobScheduler:
  proc forNamespace*(namespace: string): JobScheduler
  proc getNamespace*(): string
  proc schedule*(job: JobInfo): jint
  proc enqueue*(job: JobInfo, work: JobWorkItem): jint
  proc scheduleAsPackage*(job: JobInfo, packageName: string, userId: jint, tag: string): jint
  proc cancel*(jobId: jint)
  proc cancelAll*()
  proc cancelInAllNamespaces*()
  proc getAllPendingJobs*(): List[JobInfo]
  proc getPendingJobsInAllNamespaces*(): Map[string, List[JobInfo]]
  proc getPendingJob*(jobId: jint): JobInfo
  proc getPendingJobReason*(jobId: jint): jint
  proc getPendingJobReasons*(jobId: jint): seq[jint]
  proc getPendingJobReasonsHistory*(jobId: jint): List[PendingJobReasonsInfo]
  proc canRunUserInitiatedJobs*(): jboolean
  proc hasRunUserInitiatedJobsPermission*(packageName: string, userId: jint): jboolean
  proc getStartedJobs*(): List[JobInfo]
  proc getAllJobSnapshots*(): List[JobSnapshot]
  proc registerUserVisibleJobObserver*(observer: IUserVisibleJobObserver)
  proc unregisterUserVisibleJobObserver*(observer: IUserVisibleJobObserver)
  proc notePendingUserRequestedAppStop*(packageName: string, userId: jint, debugReason: string)

