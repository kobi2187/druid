# chatgpt.nim - ChatGPT integration

import android, options

type
  ChatGptModel* = enum
    GPT3_5, GPT4
    
  ChatMessage* = object
    role*: string  # system, user, assistant
    content*: string
    
  ChatOptions* = object
    model*: ChatGptModel
    temperature*: float
    maxTokens*: int
    topP*: float
    frequencyPenalty*: float
    presencePenalty*: float
    
  ImageGenerationOptions* = object
    prompt*: string
    n*: int  # Number of images
    size*: string  # 256x256, 512x512, or 1024x1024
    
  ChatResponseCallback* = proc(response: string, error: Option[string])
  ImageGenerationCallback* = proc(imageUrls: seq[string], error: Option[string])
    
  ChatGptManager* = ref object of Manager
    apiKey: string
    chatOptions: ChatOptions
    chatHistory: Table[string, seq[ChatMessage]]
    responseCallbacks: Table[string, ChatResponseCallback]
    imageCallbacks: Table[string, ImageGenerationCallback]

# Constructor
proc newChatGptManager*(context: Context, apiKey: string): ChatGptManager
  ## Creates a new ChatGPT manager

# Configuration
proc setDefaultOptions*(m: ChatGptManager, options: ChatOptions): bool
  ## Sets default chat options
  
proc getDefaultOptions*(m: ChatGptManager): ChatOptions
  ## Gets default chat options

# Chat completion
proc sendMessage*(m: ChatGptManager,
                message: string,
                chatId: Option[string] = none(string),
                options: Option[ChatOptions] = none(ChatOptions),
                callback: ChatResponseCallback): string
  ## Sends message to ChatGPT
  ## Returns request ID
  ## API 26+: Uses OpenAI API
  ## Requires INTERNET permission
  
proc sendMessages*(m: ChatGptManager,
                 messages: seq[ChatMessage],
                 chatId: Option[string] = none(string),
                 options: Option[ChatOptions] = none(ChatOptions),
                 callback: ChatResponseCallback): string
  ## Sends multiple messages to ChatGPT
  ## Returns request ID
  ## API 26+: Uses OpenAI API
  ## Requires INTERNET permission
  
proc cancelRequest*(m: ChatGptManager, requestId: string): bool
  ## Cancels request
  ## API 26+: Cancels API call

# Chat history
proc getChatHistory*(m: ChatGptManager, chatId: string): Option[seq[ChatMessage]]
  ## Gets chat history
  ## API 26+: Returns internal chat history
  
proc clearChatHistory*(m: ChatGptManager, chatId: string): bool
  ## Clears chat history
  ## API 26+: Clears internal chat history
  
proc getAllChatIds*(m: ChatGptManager): seq[string]
  ## Gets all chat IDs
  ## API 26+: Returns keys from internal chat history

# Image generation
proc generateImage*(m: ChatGptManager,
                  options: ImageGenerationOptions,
                  callback: ImageGenerationCallback): string
  ## Generates image with DALL-E
  ## Returns request ID
  ## API 26+: Uses OpenAI API
  ## Requires INTERNET permission