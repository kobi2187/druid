import jnim

jclass android.apphibernation.AppHibernationManager* of JVMObject:
  proc isHibernatingForUser*(packageName: string): jboolean
  proc setHibernatingForUser*(packageName: string, isHibernating: jboolean)
  proc isHibernatingGlobally*(packageName: string): jboolean
  proc setHibernatingGlobally*(packageName: string, isHibernating: jboolean)
  proc getHibernatingPackagesForUser*(): List[string]
  proc getHibernationStatsForUser*(packageNames: Set[string]): Map[string, HibernationStats]
  proc getHibernationStatsForUser*(): Map[string, HibernationStats]
  proc isOatArtifactDeletionEnabled*(): jboolean

