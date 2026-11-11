import jnim

jclass android.net.NetworkWatchlistManager* of JVMObject:
  proc reportWatchlistIfNecessary*()
  proc reloadWatchlist*()
  proc getWatchlistConfigHash*(): seq[jbyte]

