import jnim

jclass android.hardware.SystemSensorManager* of SensorManager:
  proc getSensorList*(type: jint): List[Sensor]
  proc getSensorByHandle*(sensorHandle: jint): Sensor

