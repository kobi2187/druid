import jnim

jclass android.app.StatsQuery* of JVMObject:
  proc getSqlDialect*(): jint
  proc getRawSql*(): string
  proc getMinSqlClientVersion*(): jint
  proc getPolicyConfig*(): seq[jbyte]
  DIALECT_UNKNOWN*: jint {.`static`.}
  DIALECT_SQLITE*: jint {.`static`.}

jclass android.app.StatsQuery.Builder* of JVMObject:
  proc setSqlDialect*(sqlDialect: jint): Builder
  proc setMinSqlClientVersion*(minSqlClientVersion: jint): Builder
  proc setPolicyConfig*(policyConfig: seq[jbyte]): Builder
  proc build*(): StatsQuery

jclass android.app.Builder* of JVMObject:
  proc setSqlDialect*(sqlDialect: jint): Builder
  proc setMinSqlClientVersion*(minSqlClientVersion: jint): Builder
  proc setPolicyConfig*(policyConfig: seq[jbyte]): Builder
  proc build*(): StatsQuery

