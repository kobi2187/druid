import jnim

jclass android.content.IContentProvider* of IInterface:
  proc call*(callingPkg: string, method: string, arg: string, extras: Bundle): Bundle
  proc refresh*(attributionSource: AttributionSource, url: Uri, extras: Bundle, cancellationSignal: ICancellationSignal): jboolean
  proc openTypedAssetFile*(attributionSource: AttributionSource, url: Uri, mimeType: string, opts: Bundle, signal: ICancellationSignal): AssetFileDescriptor

