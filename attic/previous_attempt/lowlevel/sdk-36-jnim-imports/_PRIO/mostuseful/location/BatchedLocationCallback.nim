import jnim

jclass android.location.BatchedLocationCallback* of JVMObject:
  proc onLocationBatch*(locations: List[Location])

