import jnim

jclass android.hardware.SerialManager* of JVMObject:
  proc getSerialPorts*(): seq[string]
  proc openSerialPort*(name: string, speed: jint): SerialPort

