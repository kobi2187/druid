import jnim

jclass android.os.CountDownTimer* of JVMObject:
  proc cancel*()
  proc start*(): CountDownTimer
  proc onTick*(millisUntilFinished: jlong)
  proc onFinish*()

