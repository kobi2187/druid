import jnim

jclass android.util.TimingLogger* of JVMObject:
  proc reset*(tag: string, label: string)
  proc reset*()
  proc addSplit*(splitLabel: string)
  proc dumpToLog*()

