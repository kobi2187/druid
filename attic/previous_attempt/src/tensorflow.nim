# tensorflow.nim - TensorFlow Lite integration

import android, options

type
  TensorflowDelegateType* = enum
    None, GPU, NNAPI
    
  TensorflowModelOptions* = object
    numThreads*: int
    useNNAPI*: bool
    useGPU*: bool
    allowFp16Precision*: bool
    
  TensorflowDataType* = enum
    Float32, Int32, UInt8, Int64, String
    
  TensorflowTensorData* = object
    case dataType*: TensorflowDataType
    of Float32:
      floatData*: seq[float32]
    of Int32:
      int32Data*: seq[int32]
    of UInt8:
      uint8Data*: seq[uint8]
    of Int64:
      int64Data*: seq[int64]
    of String:
      stringData*: seq[string]
      
  TensorflowTensor* = object
    index*: int
    name*: string
    shape*: seq[int]
    dataType*: TensorflowDataType
    data*: TensorflowTensorData
    
  TensorflowModel* = object
    id*: string
    inputTensors*: seq[TensorflowTensor]
    outputTensors*: seq[TensorflowTensor]
    
  TensorflowInferenceCallback* = proc(outputs: seq[TensorflowTensor], error: Option[string])
    
  TensorflowManager* = ref object of Manager
    models: Table[string, pointer]  # JNI references to TensorFlow Interpreter
    modelOptions: Table[string, TensorflowModelOptions]
    inferenceCallbacks: Table[string, TensorflowInferenceCallback]

# Constructor
proc newTensorflowManager*(context: Context): TensorflowManager
  ## Creates a new TensorFlow manager

# Model loading
proc loadModelFromAsset*(m: TensorflowManager,
                       assetPath: string,
                       options: TensorflowModelOptions = TensorflowModelOptions(numThreads: 1, useNNAPI: false, useGPU: false, allowFp16Precision: false)): Option[string]
  ## Loads TensorFlow Lite model from assets
  ## Returns model ID
  ## API 26+: Uses TensorFlow Lite Interpreter
  
proc loadModelFromFile*(m: TensorflowManager,
                      filePath: string,
                      options: TensorflowModelOptions = TensorflowModelOptions(numThreads: 1, useNNAPI: false, useGPU: false, allowFp16Precision: false)): Option[string]
  ## Loads TensorFlow Lite model from file
  ## Returns model ID
  ## API 26+: Uses TensorFlow Lite Interpreter
  
proc unloadModel*(m: TensorflowManager, modelId: string): bool
  ## Unloads model and frees resources
  ## API 26+: Uses Interpreter.close
  
proc getInputTensors*(m: TensorflowManager, modelId: string): seq[TensorflowTensor]
  ## Gets model input tensors
  ## API 26+: Uses Interpreter.getInputTensor
  
proc getOutputTensors*(m: TensorflowManager, modelId: string): seq[TensorflowTensor]
  ## Gets model output tensors
  ## API 26+: Uses Interpreter.getOutputTensor

# Inference
proc runInference*(m: TensorflowManager,
                 modelId: string,
                 inputs: seq[TensorflowTensor],
                 callback: TensorflowInferenceCallback): bool
  ## Runs inference
  ## API 26+: Uses Interpreter.run
  
proc resizeInputTensor*(m: TensorflowManager,
                      modelId: string,
                      tensorIndex: int,
                      newShape: seq[int]): bool
  ## Resizes input tensor
  ## API 26+: Uses Interpreter.resizeInput
  
proc setNumThreads*(m: TensorflowManager,
                  modelId: string,
                  numThreads: int): bool
  ## Sets number of threads for inference
  ## API 26+: Uses Interpreter.setNumThreads
  
proc useNNAPI*(m: TensorflowManager,
             modelId: string,
             enable: bool): bool
  ## Enables/disables NNAPI
  ## API 26+: Uses Interpreter.setUseNNAPI

# Utility functions
proc createFloatTensor*(m: TensorflowManager,
                      index: int,
                      name: string,
                      shape: seq[int],
                      data: seq[float32]): TensorflowTensor
  ## Creates float tensor
  
proc createInt32Tensor*(m: TensorflowManager,
                      index: int,
                      name: string,
                      shape: seq[int],
                      data: seq[int32]): TensorflowTensor
  ## Creates int32 tensor
  
proc createUInt8Tensor*(m: TensorflowManager,
                      index: int,
                      name: string,
                      shape: seq[int],
                      data: seq[uint8]): TensorflowTensor
  ## Creates uint8 tensor