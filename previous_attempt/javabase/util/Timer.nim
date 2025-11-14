import jnim

jclass java.util.Timer* of JVMObject:
  proc schedule*(task: TimerTask, delay: jlong)
  proc schedule*(task: TimerTask, time: Date)
  proc schedule*(task: TimerTask, delay: jlong, period: jlong)
  proc schedule*(task: TimerTask, firstTime: Date, period: jlong)
  proc scheduleAtFixedRate*(task: TimerTask, delay: jlong, period: jlong)
  proc scheduleAtFixedRate*(task: TimerTask, firstTime: Date, period: jlong)
  proc cancel*()
  proc purge*(): jint

