# share.nim - Content sharing utilities

import android, options

type
  ShareContentType* = enum
    Text, Image, File, Multiple
    
  ShareContent* = object
    case contentType*: ShareContentType
    of Text:
      text*: string
      subject*: Option[string]
    of Image:
      imageUri*: string
      imageSubject*: Option[string]
      imageText*: Option[string]
    of File:
      fileUri*: string
      fileMimeType*: string
      fileSubject*: Option[string]
      fileText*: Option[string]
    of Multiple:
      uris*: seq[string]
      mimeType*: string
      multipleSubject*: Option[string]
      multipleText*: Option[string]
      
  ShareResult* = enum
    Completed, Cancelled, Failed
    
  ShareCallback* = proc(result: ShareResult)
    
  ShareManager* = ref object of Manager
    callbacks: Table[int, ShareCallback]
    nextRequestCode: int
    activity: Option[Activity]

# Constructor
proc newShareManager*(context: Context, activity: Option[Activity] = none(Activity)): ShareManager
  ## Creates a new share manager
  ## Activity required for share result callback

# Content sharing
proc shareText*(m: ShareManager, 
              text: string,
              subject: Option[string] = none(string),
              chooserTitle: string = "Share text",
              callback: Option[ShareCallback] = none(ShareCallback)): bool
  ## Shares text
  ## API 26+: Uses Intent.ACTION_SEND with EXTRA_TEXT
  
proc shareImage*(m: ShareManager, 
               imageUri: string,
               text: Option[string] = none(string),
               subject: Option[string] = none(string),
               chooserTitle: string = "Share image",
               callback: Option[ShareCallback] = none(ShareCallback)): bool
  ## Shares image
  ## API 26+: Uses Intent.ACTION_SEND with EXTRA_STREAM
  ## Requires FileProvider for API 24+
  
proc shareFile*(m: ShareManager, 
              fileUri: string,
              mimeType: string,
              text: Option[string] = none(string),
              subject: Option[string] = none(string),
              chooserTitle: string = "Share file",
              callback: Option[ShareCallback] = none(ShareCallback)): bool
  ## Shares file
  ## API 26+: Uses Intent.ACTION_SEND with EXTRA_STREAM
  ## Requires FileProvider for API 24+
  
proc shareMultiple*(m: ShareManager, 
                  uris: seq[string],
                  mimeType: string,
                  text: Option[string] = none(string),
                  subject: Option[string] = none(string),
                  chooserTitle: string = "Share files",
                  callback: Option[ShareCallback] = none(ShareCallback)): bool
  ## Shares multiple files
  ## API 26+: Uses Intent.ACTION_SEND_MULTIPLE
  ## Requires FileProvider for API 24+
  
proc shareContent*(m: ShareManager, 
                 content: ShareContent,
                 chooserTitle: string = "Share",
                 callback: Option[ShareCallback] = none(ShareCallback)): bool
  ## Shares content using unified object
  ## API 26+: Uses Intent.ACTION_SEND
  ## Requires FileProvider for API 24+

# Utility functions
proc getShareableUri*(m: ShareManager, filePath: string): Option[string]
  ## Converts file path to shareable URI
  ## API 26+: Uses FileProvider.getUriForFile
  
proc setActivity*(m: ShareManager, activity: Activity)
  ## Sets activity for share result callback