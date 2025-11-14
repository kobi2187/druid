# translation.nim - Text translation

import android, options

type
  TranslationLanguage* = enum
    English = "en", Spanish = "es", French = "fr", German = "de",
    Italian = "it", Portuguese = "pt", Russian = "ru", Chinese = "zh",
    Japanese = "ja", Korean = "ko", Arabic = "ar", Hindi = "hi"
    
  TranslationModel* = enum
    Cloud, Device
    
  TranslationResult* = object
    sourceText*: string
    translatedText*: string
    sourceLanguage*: TranslationLanguage
    targetLanguage*: TranslationLanguage
    model*: TranslationModel
    
  TranslationCallback* = proc(result: TranslationResult)
  TranslationErrorCallback* = proc(error: string)
    
  TranslationManager* = ref object of Manager
    translator: pointer  # JNI reference
    callbacks: Table[string, TranslationCallback]
    errorCallbacks: Table[string, TranslationErrorCallback]
    availableLanguages: set[TranslationLanguage]
    downloadedLanguages: set[TranslationLanguage]

# Constructor
proc newTranslationManager*(context: Context): TranslationManager
  ## Creates a new translation manager
  ## API 26+: Uses ML Kit Translation or Google Cloud Translation

# Language management
proc getAvailableLanguages*(m: TranslationManager, model: TranslationModel = Cloud): set[TranslationLanguage]
  ## Gets available languages
  ## API 26+: Uses ML Kit or Google Cloud APIs
  
proc getDownloadedLanguages*(m: TranslationManager): set[TranslationLanguage]
  ## Gets downloaded languages for offline translation
  ## API 26+: Uses ML Kit
  
proc downloadLanguage*(m: TranslationManager, 
                     language: TranslationLanguage,
                     callback: proc(success: bool)): bool
  ## Downloads language for offline translation
  ## API 26+: Uses ML Kit
  
proc deleteLanguage*(m: TranslationManager, language: TranslationLanguage): bool
  ## Deletes downloaded language
  ## API 26+: Uses ML Kit

# Translation
proc translate*(m: TranslationManager,
              text: string,
              sourceLanguage: Option[TranslationLanguage] = none(TranslationLanguage),
              targetLanguage: TranslationLanguage,
              model: TranslationModel = Cloud,
              callback: TranslationCallback,
              errorCallback: Option[TranslationErrorCallback] = none(TranslationErrorCallback)): string
  ## Translates text
  ## Returns translation ID
  ## API 26+: Uses ML Kit or Google Cloud APIs
  
proc batchTranslate*(m: TranslationManager,
                   texts: seq[string],
                   sourceLanguage: Option[TranslationLanguage] = none(TranslationLanguage),
                   targetLanguage: TranslationLanguage,
                   model: TranslationModel = Cloud,
                   callback: proc(results: seq[TranslationResult]),
                   errorCallback: Option[proc(error: string)] = none(proc(error: string))): string
  ## Translates multiple texts
  ## Returns translation ID
  ## API 26+: Uses ML Kit or Google Cloud APIs

# Utility functions
proc detectLanguage*(m: TranslationManager,
                   text: string,
                   callback: proc(language: TranslationLanguage, confidence: float),
                   errorCallback: Option[proc(error: string)] = none(proc(error: string))): string
  ## Detects language of text
  ## Returns detection ID
  ## API 26+: Uses ML Kit or Google Cloud APIs
  
proc isDeviceTranslationSupported*(m: TranslationManager): bool
  ## Checks if device translation is supported
  ## API 26+: Uses ML Kit