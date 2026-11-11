# database.nim - SQLite database access

import android, options

type
  DatabaseOpenMode* = enum
    ReadOnly, ReadWrite, ReadWriteCreate
    
  ColumnType* = enum
    Integer, Text, Real, Blob, Null
    
  ColumnValue* = object
    ## Database column value
    case kind*: ColumnType
    of Integer:
      intVal*: int
    of Text:
      textVal*: string
    of Real:
      realVal*: float
    of Blob:
      blobVal*: seq[byte]
    of Null:
      discard
      
  DatabaseRow* = seq[ColumnValue]
  DatabaseResult* = seq[DatabaseRow]
  
  ConflictAction* = enum
    Replace, Ignore, Fail, Abort, Rollback
    
  DatabaseInfo* = object
    path*: string
    size*: int64
    lastModified*: Time
    version*: int
    
  DatabaseManager* = ref object of Manager
    openDatabases: Table[string, pointer]  # Path to SQLiteDatabase JNI reference
    context: Context

# Constructor
proc newDatabaseManager*(context: Context): DatabaseManager
  ## Creates a new database manager

# Database operations
proc openDatabase*(m: DatabaseManager, path: string, mode: DatabaseOpenMode = ReadWriteCreate): bool
  ## Opens database
  ## API 26+: Uses SQLiteDatabase.openDatabase
  
proc closeDatabase*(m: DatabaseManager, path: string): bool
  ## Closes database
  ## API 26+: Uses SQLiteDatabase.close
  
proc getDatabaseInfo*(m: DatabaseManager, path: string): Option[DatabaseInfo]
  ## Gets database information
  ## API 26+: Uses File and SQLiteDatabase
  
proc deleteDatabase*(m: DatabaseManager, path: string): bool
  ## Deletes database file
  ## API 26+: Uses context.deleteDatabase

# Query execution
proc execQuery*(m: DatabaseManager, 
              path: string,
              query: string,
              args: varargs[string, `$`]): DatabaseResult
  ## Executes query
  ## API 26+: Uses SQLiteDatabase.rawQuery
  
proc execStatement*(m: DatabaseManager,
                  path: string,
                  statement: string,
                  args: varargs[string, `$`]): int
  ## Executes statement
  ## Returns number of affected rows
  ## API 26+: Uses SQLiteDatabase.execSQL
  
proc insert*(m: DatabaseManager,
           path: string,
           table: string,
           values: Table[string, ColumnValue],
           conflictAction: ConflictAction = Replace): int64
  ## Inserts row
  ## Returns row ID or -1 on failure
  ## API 26+: Uses SQLiteDatabase.insert or insertWithOnConflict
  
proc update*(m: DatabaseManager,
           path: string,
           table: string,
           values: Table[string, ColumnValue],
           whereClause: string,
           whereArgs: varargs[string, `$`],
           conflictAction: ConflictAction = Replace): int
  ## Updates rows
  ## Returns number of affected rows
  ## API 26+: Uses SQLiteDatabase.update or updateWithOnConflict
  
proc delete*(m: DatabaseManager,
           path: string,
           table: string,
           whereClause: string,
           whereArgs: varargs[string, `$`]): int
  ## Deletes rows
  ## Returns number of affected rows
  ## API 26+: Uses SQLiteDatabase.delete

# Transaction handling
proc beginTransaction*(m: DatabaseManager, path: string): bool
  ## Begins transaction
  ## API 26+: Uses SQLiteDatabase.beginTransaction
  
proc setTransactionSuccessful*(m: DatabaseManager, path: string): bool
  ## Marks transaction as successful
  ## API 26+: Uses SQLiteDatabase.setTransactionSuccessful
  
proc endTransaction*(m: DatabaseManager, path: string): bool
  ## Ends transaction
  ## API 26+: Uses SQLiteDatabase.endTransaction

# Utility functions
proc intValue*(value: int): ColumnValue
  ## Creates integer column value
  
proc textValue*(value: string): ColumnValue
  ## Creates text column value
  
proc realValue*(value: float): ColumnValue
  ## Creates real column value
  
proc blobValue*(value: seq[byte]): ColumnValue
  ## Creates blob column value
  
proc nullValue*(): ColumnValue
  ## Creates null column value