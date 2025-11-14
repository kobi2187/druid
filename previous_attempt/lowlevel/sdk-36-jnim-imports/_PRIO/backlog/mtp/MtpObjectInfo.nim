import jnim

jclass android.mtp.MtpObjectInfo* of JVMObject:
  proc getObjectHandle*(): jint
  proc getStorageId*(): jint
  proc getFormat*(): jint
  proc getProtectionStatus*(): jint
  proc getCompressedSize*(): jint
  proc getCompressedSizeLong*(): jlong
  proc getThumbFormat*(): jint
  proc getThumbCompressedSize*(): jint
  proc getThumbCompressedSizeLong*(): jlong
  proc getThumbPixWidth*(): jint
  proc getThumbPixWidthLong*(): jlong
  proc getThumbPixHeight*(): jint
  proc getThumbPixHeightLong*(): jlong
  proc getImagePixWidth*(): jint
  proc getImagePixWidthLong*(): jlong
  proc getImagePixHeight*(): jint
  proc getImagePixHeightLong*(): jlong
  proc getImagePixDepth*(): jint
  proc getImagePixDepthLong*(): jlong
  proc getParent*(): jint
  proc getAssociationType*(): jint
  proc getAssociationDesc*(): jint
  proc getSequenceNumber*(): jint
  proc getSequenceNumberLong*(): jlong
  proc getName*(): string
  proc getDateCreated*(): jlong
  proc getDateModified*(): jlong
  proc getKeywords*(): string

jclass android.mtp.MtpObjectInfo.Builder* of JVMObject:
  proc setObjectHandle*(value: jint): Builder
  proc setAssociationDesc*(value: jint): Builder
  proc setAssociationType*(value: jint): Builder
  proc setCompressedSize*(value: jlong): Builder
  proc setDateCreated*(value: jlong): Builder
  proc setDateModified*(value: jlong): Builder
  proc setFormat*(value: jint): Builder
  proc setImagePixDepth*(value: jlong): Builder
  proc setImagePixHeight*(value: jlong): Builder
  proc setImagePixWidth*(value: jlong): Builder
  proc setKeywords*(value: string): Builder
  proc setName*(value: string): Builder
  proc setParent*(value: jint): Builder
  proc setProtectionStatus*(value: jint): Builder
  proc setSequenceNumber*(value: jlong): Builder
  proc setStorageId*(value: jint): Builder
  proc setThumbCompressedSize*(value: jlong): Builder
  proc setThumbFormat*(value: jint): Builder
  proc setThumbPixHeight*(value: jlong): Builder
  proc setThumbPixWidth*(value: jlong): Builder
  proc build*(): MtpObjectInfo

jclass android.mtp.Builder* of JVMObject:
  proc setObjectHandle*(value: jint): Builder
  proc setAssociationDesc*(value: jint): Builder
  proc setAssociationType*(value: jint): Builder
  proc setCompressedSize*(value: jlong): Builder
  proc setDateCreated*(value: jlong): Builder
  proc setDateModified*(value: jlong): Builder
  proc setFormat*(value: jint): Builder
  proc setImagePixDepth*(value: jlong): Builder
  proc setImagePixHeight*(value: jlong): Builder
  proc setImagePixWidth*(value: jlong): Builder
  proc setKeywords*(value: string): Builder
  proc setName*(value: string): Builder
  proc setParent*(value: jint): Builder
  proc setProtectionStatus*(value: jint): Builder
  proc setSequenceNumber*(value: jlong): Builder
  proc setStorageId*(value: jint): Builder
  proc setThumbCompressedSize*(value: jlong): Builder
  proc setThumbFormat*(value: jint): Builder
  proc setThumbPixHeight*(value: jlong): Builder
  proc setThumbPixWidth*(value: jlong): Builder
  proc build*(): MtpObjectInfo

