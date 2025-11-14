import jnim

jclass android.graphics.Camera* of JVMObject:
  proc save*()
  proc restore*()
  proc translate*(x: jfloat, y: jfloat, z: jfloat)
  proc rotateX*(deg: jfloat)
  proc rotateY*(deg: jfloat)
  proc rotateZ*(deg: jfloat)
  proc rotate*(x: jfloat, y: jfloat, z: jfloat)
  proc getLocationX*(): jfloat
  proc getLocationY*(): jfloat
  proc getLocationZ*(): jfloat
  proc setLocation*(x: jfloat, y: jfloat, z: jfloat)
  proc getMatrix*(matrix: Matrix)
  proc applyToCanvas*(canvas: Canvas)
  proc dotWithNormal*(dx: jfloat, dy: jfloat, dz: jfloat): jfloat

