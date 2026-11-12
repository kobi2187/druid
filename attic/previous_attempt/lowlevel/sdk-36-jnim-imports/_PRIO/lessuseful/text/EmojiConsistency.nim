import jnim

jclass android.text.EmojiConsistency* of JVMObject:
  proc getEmojiConsistencySet*(): Set[seq[jint]] {.`static`.}

