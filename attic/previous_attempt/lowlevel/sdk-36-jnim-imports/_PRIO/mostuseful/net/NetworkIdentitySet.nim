import jnim

jclass android.net.NetworkIdentitySet* of HashSet:
  proc writeToStream*(output:DataOutput)
  proc isAnyMemberMetered*(): jboolean
  proc isAnyMemberRoaming*(): jboolean
  proc areAllMembersOnDefaultNetwork*(): jboolean
  proc compare*(left: NetworkIdentitySet, right: NetworkIdentitySet): jint {.`static`.}
  proc dumpDebug*(proto: ProtoOutputStream, tag: jlong)

