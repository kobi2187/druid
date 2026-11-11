import jnim

jclass java.lang.ModuleLayer* of JVMObject:
  proc defineModulesWithOneLoader*(cf: Configuration, parentLoader: ClassLoader): ModuleLayer
  proc defineModulesWithManyLoaders*(cf: Configuration, parentLoader: ClassLoader): ModuleLayer
  proc defineModules*(cf: Configuration, clf: Function[string, ClassLoader]): ModuleLayer
  proc defineModulesWithOneLoader*(cf: Configuration, parentLayers: List[ModuleLayer], parentLoader: ClassLoader): Controller {.`static`.}
  proc defineModulesWithManyLoaders*(cf: Configuration, parentLayers: List[ModuleLayer], parentLoader: ClassLoader): Controller {.`static`.}
  proc defineModules*(cf: Configuration, parentLayers: List[ModuleLayer], clf: Function[string, ClassLoader]): Controller {.`static`.}
  proc configuration*(): Configuration
  proc parents*(): List[ModuleLayer]
  proc modules*(): Set[Module]
  proc findModule*(name: string): Optional[Module]
  proc findLoader*(name: string): ClassLoader
  proc toString*(): string
  proc empty*(): ModuleLayer {.`static`.}
  proc boot*(): ModuleLayer {.`static`.}

jclass java.lang.ModuleLayer.Controller* of JVMObject:
  proc layer*(): ModuleLayer
  proc addReads*(source: Module, target: Module): Controller
  proc addExports*(source: Module, pn: string, target: Module): Controller
  proc addOpens*(source: Module, pn: string, target: Module): Controller
  proc enableNativeAccess*(target: Module): Controller

jclass java.lang.Controller* of JVMObject:
  proc layer*(): ModuleLayer
  proc addReads*(source: Module, target: Module): Controller
  proc addExports*(source: Module, pn: string, target: Module): Controller
  proc addOpens*(source: Module, pn: string, target: Module): Controller
  proc enableNativeAccess*(target: Module): Controller

