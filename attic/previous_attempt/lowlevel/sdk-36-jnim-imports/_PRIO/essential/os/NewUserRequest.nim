import jnim

jclass android.os.NewUserRequest* of JVMObject:
  proc getName*(): string
  proc isEphemeral*(): jboolean
  proc isAdmin*(): jboolean
  proc getUserType*(): string
  proc getUserIcon*(): Bitmap
  proc getAccountName*(): string
  proc getAccountType*(): string
  proc getAccountOptions*(): PersistableBundle
  proc toString*(): string

jclass android.os.NewUserRequest.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc setAdmin*(): Builder
  proc setEphemeral*(): Builder
  proc setUserType*(type: string): Builder
  proc setUserIcon*(userIcon: Bitmap): Builder
  proc setAccountName*(accountName: string): Builder
  proc setAccountType*(accountType: string): Builder
  proc setAccountOptions*(accountOptions: PersistableBundle): Builder
  proc build*(): NewUserRequest

jclass android.os.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc setAdmin*(): Builder
  proc setEphemeral*(): Builder
  proc setUserType*(type: string): Builder
  proc setUserIcon*(userIcon: Bitmap): Builder
  proc setAccountName*(accountName: string): Builder
  proc setAccountType*(accountType: string): Builder
  proc setAccountOptions*(accountOptions: PersistableBundle): Builder
  proc build*(): NewUserRequest

