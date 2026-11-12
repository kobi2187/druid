import jnim

jclass android.app.ApplicationLoaders* of JVMObject:
  proc getDefault*(): ApplicationLoaders {.`static`.}
  proc createAndCacheNonBootclasspathSystemClassLoaders*(libs: List[SharedLibraryInfo])
  proc getCachedNonBootclasspathSystemLib*(zip: string, parent: ClassLoader, classLoaderName: string, sharedLibraries: List[ClassLoader]): ClassLoader
  proc createAndCacheWebViewClassLoader*(packagePath: string, libsPath: string, cacheKey: string): ClassLoader

