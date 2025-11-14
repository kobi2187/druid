import jnim

jclass android.ranging.CapabilitiesListener* of Stub:
  proc register*(executor: Executor, callback: RangingCapabilitiesCallback)
  proc unregister*(callback: RangingCapabilitiesCallback)
  proc onRangingCapabilities*(rangingCapabilities: RangingCapabilities)

