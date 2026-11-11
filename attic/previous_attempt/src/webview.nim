# webview.nim - WebView utilities

import android, options

type
  WebSettings* = object
    javaScriptEnabled*: bool
    domStorageEnabled*: bool
    databaseEnabled*: bool
    loadWithOverviewMode*: bool
    useWideViewPort*: bool
    allowFileAccess*: bool
    allowContentAccess*: bool
    loadsImagesAutomatically*: bool
    mixedContentMode*: int
    cacheMode*: int
    
  WebPermission* = enum
    Location, Camera, Microphone, 
    Notifications, Storage, Midi
    
  WebViewCallback* = object
    onPageStarted*: Option[proc(url: string)]
    onPageFinished*: Option[proc(url: string)]
    onError*: Option[proc(errorCode: int, description: string, url: string)]
    onConsoleMessage*: Option[proc(message: string, lineNumber: int, sourceId: string)]
    
  WebViewManager* = ref object of Manager
    webViews: Table[string, pointer]  # ID to WebView JNI reference
    settings: Table[string, WebSettings]
    callbacks: Table[string, WebViewCallback]
    cookieManager: pointer  # JNI reference

# Constructor
proc newWebViewManager*(context: Context): WebViewManager
  ## Creates a new WebView manager

# WebView management
proc createWebView*(m: WebViewManager,
                  viewId: string,
                  settings: WebSettings,
                  callback: WebViewCallback): bool
  ## Creates WebView with settings
  ## API 26+: Uses WebView with modern settings
  
proc destroyWebView*(m: WebViewManager, viewId: string): bool
  ## Destroys WebView
  ## API 26+: Uses WebView.destroy
  
proc pauseWebView*(m: WebViewManager, viewId: string): bool
  ## Pauses WebView
  ## API 26+: Uses WebView.onPause
  
proc resumeWebView*(m: WebViewManager, viewId: string): bool
  ## Resumes WebView
  ## API 26+: Uses WebView.onResume

# Navigation
proc loadUrl*(m: WebViewManager, viewId: string, url: string): bool
  ## Loads URL in WebView
  ## API 26+: Uses WebView.loadUrl
  
proc loadHtml*(m: WebViewManager, viewId: string, html: string, baseUrl: Option[string] = none(string)): bool
  ## Loads HTML in WebView
  ## API 26+: Uses WebView.loadDataWithBaseURL
  
proc reload*(m: WebViewManager, viewId: string): bool
  ## Reloads WebView
  ## API 26+: Uses WebView.reload
  
proc stopLoading*(m: WebViewManager, viewId: string): bool
  ## Stops WebView loading
  ## API 26+: Uses WebView.stopLoading
  
proc goBack*(m: WebViewManager, viewId: string): bool
  ## Navigates back in WebView
  ## API 26+: Uses WebView.goBack
  
proc goForward*(m: WebViewManager, viewId: string): bool
  ## Navigates forward in WebView
  ## API 26+: Uses WebView.goForward
  
proc canGoBack*(m: WebViewManager, viewId: string): bool
  ## Checks if WebView can go back
  ## API 26+: Uses WebView.canGoBack

# JavaScript interfaces
proc addJavaScriptInterface*(m: WebViewManager, 
                           viewId: string,
                           objectName: string,
                           methods: Table[string, proc(args: seq[string]): string]): bool
  ## Adds JavaScript interface
  ## API 26+: Uses WebView.addJavascriptInterface
  
proc evaluateJavaScript*(m: WebViewManager,
                       viewId: string,
                       script: string,
                       callback: Option[proc(result: string)] = none(proc(result: string))): bool
  ## Evaluates JavaScript
  ## API 26+: Uses WebView.evaluateJavascript

# Cookie management
proc getCookie*(m: WebViewManager, url: string): Option[string]
  ## Gets cookie for URL
  ## API 26+: Uses CookieManager.getCookie
  
proc setCookie*(m: WebViewManager, url: string, cookie: string): bool
  ## Sets cookie for URL
  ## API 26+: Uses CookieManager.setCookie
  
proc clearCookies*(m: WebViewManager): bool
  ## Clears all cookies
  ## API 26+: Uses CookieManager.removeAllCookies