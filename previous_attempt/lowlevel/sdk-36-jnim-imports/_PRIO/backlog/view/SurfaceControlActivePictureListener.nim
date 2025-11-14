import jnim

jclass android.view.SurfaceControlActivePictureListener* of JVMObject:
  proc onActivePicturesChanged*(activePictures: seq[SurfaceControlActivePicture])
  proc startListening*()
  proc stopListening*()

