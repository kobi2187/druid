import jnim

jclass android.net.NetworkRecommendationProvider* of JVMObject:
  proc onRequestScores*(networks: seq[NetworkKey])
  proc getBinder*(): IBinder

