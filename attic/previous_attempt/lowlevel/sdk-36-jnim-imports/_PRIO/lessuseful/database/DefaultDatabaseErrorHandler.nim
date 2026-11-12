import jnim

jclass android.database.DefaultDatabaseErrorHandler* of JVMObject:
  proc onCorruption*(dbObj: SQLiteDatabase)

