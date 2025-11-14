## android/input.nim - Unified Input API

import std/[tables, options]
import core, graphics

type
  TouchPoint* = object
    id*: int32
    x*, y*: float32
    pressure*: float32
    size*: float32

  TouchEvent* = object
    action*: TouchAction
    points*: seq[TouchPoint]
    timestamp*: int64

  TouchAction* = enum
    taDown = "Touch down"
    taUp = "Touch up" 
    taMove = "Touch move"
    taCancel = "Touch cancel"

  KeyEvent* = object
    keyCode*: KeyCode
    action*: KeyAction
    timestamp*: int64
    modifiers*: set[KeyModifier]

  KeyAction* = enum
    kaDown = "Key down"
    kaUp = "Key up"
    kaRepeat = "Key repeat"

  KeyCode* = enum
    kcBack = 4
    kcMenu = 82
    kcHome = 3
    kcVolumeUp = 24
    kcVolumeDown = 25
    kcPower = 26
    kcCamera = 27
    kcSpace = 62
    kcEnter = 66
    kcDelete = 67
    kcEscape = 111
    kcA = 29, kcB = 30, kcC = 31, kcD = 32, kcE = 33
    kcF = 34, kcG = 35, kcH = 36, kcI = 37, kcJ = 38
    kcK = 39, kcL = 40, kcM = 41, kcN = 42, kcO = 43
    kcP = 44, kcQ = 45, kcR = 46, kcS = 47, kcT = 48
    kcU = 49, kcV = 50, kcW = 51, kcX = 52, kcY = 53
    kcZ = 54
    kc0 = 7, kc1 = 8, kc2 = 9, kc3 = 10, kc4 = 11
    kc5 = 12, kc6 = 13, kc7 = 14, kc8 = 15, kc9 = 16

  KeyModifier* = enum
    kmShift = "Shift"
    kmCtrl = "Control"
    kmAlt = "Alt"
    kmMeta = "Meta"

  GamepadButton* = enum
    gbA, gbB, gbX, gbY
    gbLeftShoulder, gbRightShoulder
    gbLeftTrigger, gbRightTrigger
    gbSelect, gbStart, gbMenu
    gbLeftStick, gbRightStick
    gbDpadUp, gbDpadDown, gbDpadLeft, gbDpadRight

  GamepadStick* = object
    x*, y*: float32

  GamepadState* = object
    connected*: bool
    buttons*: set[GamepadButton]
    leftStick*, rightStick*: GamepadStick
    leftTrigger*, rightTrigger*: float32

  InputManager* = ref object
    ## High-level input manager

  Gesture* = object
    gestureType*: GestureType
    position*: Vector2
    delta*: Vector2
    scale*: float32
    rotation*: float32

  GestureType* = enum
    gtTap = "Tap"
    gtDoubleTap = "Double tap"
    gtLongPress = "Long press"
    gtPinch = "Pinch"
    gtSwipe = "Swipe"
    gtRotation = "Rotation"

# Input Manager
proc newInputManager*(): InputManager =
  ## Create input manager
  trackFeature(afInput)

proc update*(input: InputManager) =
  ## Update input state (call once per frame)
  discard

proc close*(input: InputManager) =
  ## Close input manager
  discard

# Touch Input
proc getTouchCount*(input: InputManager): int32 =
  ## Get number of active touch points
  discard

proc getTouch*(input: InputManager, index: int32): TouchPoint =
  ## Get touch point by index
  discard

proc getAllTouches*(input: InputManager): seq[TouchPoint] =
  ## Get all active touch points
  discard

proc isTouching*(input: InputManager): bool =
  ## Check if screen is being touched
  discard

proc getTouchPosition*(input: InputManager, index = 0): Vector2 =
  ## Get touch position
  discard

proc getTouchDelta*(input: InputManager, index = 0): Vector2 =
  ## Get touch movement delta
  discard

proc wasTouchPressed*(input: InputManager, index = 0): bool =
  ## Check if touch was just pressed this frame
  discard

proc wasTouchReleased*(input: InputManager, index = 0): bool =
  ## Check if touch was just released this frame
  discard

proc getTouchPressure*(input: InputManager, index = 0): float32 =
  ## Get touch pressure (0.0 to 1.0)
  discard

# Touch Event Callbacks
proc onTouchDown*(input: InputManager, callback: proc(touch: TouchPoint)) =
  ## Set touch down callback
  discard

proc onTouchUp*(input: InputManager, callback: proc(touch: TouchPoint)) =
  ## Set touch up callback
  discard

proc onTouchMove*(input: InputManager, callback: proc(touch: TouchPoint)) =
  ## Set touch move callback
  discard

# Keyboard Input
proc isKeyPressed*(input: InputManager, key: KeyCode): bool =
  ## Check if key is currently pressed
  discard

proc wasKeyPressed*(input: InputManager, key: KeyCode): bool =
  ## Check if key was just pressed this frame
  discard

proc wasKeyReleased*(input: InputManager, key: KeyCode): bool =
  ## Check if key was just released this frame
  discard

proc getTextInput*(input: InputManager): string =
  ## Get text input from virtual keyboard
  discard

proc showVirtualKeyboard*(input: InputManager) =
  ## Show virtual keyboard
  discard

proc hideVirtualKeyboard*(input: InputManager) =
  ## Hide virtual keyboard
  discard

proc isVirtualKeyboardVisible*(input: InputManager): bool =
  ## Check if virtual keyboard is visible
  discard

# Key Event Callbacks
proc onKeyDown*(input: InputManager, callback: proc(key: KeyCode)) =
  ## Set key down callback
  discard

proc onKeyUp*(input: InputManager, callback: proc(key: KeyCode)) =
  ## Set key up callback
  discard

proc onTextInput*(input: InputManager, callback: proc(text: string)) =
  ## Set text input callback
  discard

# Gesture Recognition
proc getGesture*(input: InputManager): Option[Gesture] =
  ## Get current gesture (if any)
  discard

proc enableGestures*(input: InputManager, gestures: set[GestureType]) =
  ## Enable specific gesture types
  discard

proc onGesture*(input: InputManager, callback: proc(gesture: Gesture)) =
  ## Set gesture callback
  discard

proc onTap*(input: InputManager, callback: proc(pos: Vector2)) =
  ## Set tap gesture callback
  discard

proc onDoubleTap*(input: InputManager, callback: proc(pos: Vector2)) =
  ## Set double tap callback
  discard

proc onLongPress*(input: InputManager, callback: proc(pos: Vector2)) =
  ## Set long press callback
  discard

proc onPinch*(input: InputManager, callback: proc(center: Vector2, scale: float32)) =
  ## Set pinch gesture callback
  discard

proc onSwipe*(input: InputManager, callback: proc(start, end: Vector2)) =
  ## Set swipe gesture callback
  discard

# Game Controller Support
proc getGamepadCount*(input: InputManager): int32 =
  ## Get number of connected gamepads
  trackFeature(afGameController)

proc getGamepadState*(input: InputManager, index = 0): GamepadState =
  ## Get gamepad state
  trackFeature(afGameController)

proc isGamepadConnected*(input: InputManager, index = 0): bool =
  ## Check if gamepad is connected
  trackFeature(afGameController)

proc isGamepadButtonPressed*(input: InputManager, button: GamepadButton, index = 0): bool =
  ## Check if gamepad button is pressed
  trackFeature(afGameController)

proc wasGamepadButtonPressed*(input: InputManager, button: GamepadButton, index = 0): bool =
  ## Check if gamepad button was just pressed
  trackFeature(afGameController)

proc wasGamepadButtonReleased*(input: InputManager, button: GamepadButton, index = 0): bool =
  ## Check if gamepad button was just released
  trackFeature(afGameController)

proc getGamepadStick*(input: InputManager, stick: string, index = 0): GamepadStick =
  ## Get gamepad stick position
  trackFeature(afGameController)

proc getGamepadTrigger*(input: InputManager, trigger: string, index = 0): float32 =
  ## Get gamepad trigger value
  trackFeature(afGameController)

proc setGamepadVibration*(input: InputManager, left, right: float32, index = 0) =
  ## Set gamepad vibration
  trackFeature(afGameController)

# Gamepad Event Callbacks
proc onGamepadConnected*(input: InputManager, callback: proc(index: int32)) =
  ## Set gamepad connected callback
  trackFeature(afGameController)

proc onGamepadDisconnected*(input: InputManager, callback: proc(index: int32)) =
  ## Set gamepad disconnected callback
  trackFeature(afGameController)

proc onGamepadButton*(input: InputManager, callback: proc(button: GamepadButton, pressed: bool, index: int32)) =
  ## Set gamepad button callback
  trackFeature(afGameController)

# Sensor Input
proc getAcceleration*(input: InputManager): Vector3 =
  ## Get device acceleration
  trackFeature(afSensors)

proc getGyroscope*(input: InputManager): Vector3 =
  ## Get device rotation rate
  trackFeature(afSensors)

proc getMagnetometer*(input: InputManager): Vector3 =
  ## Get magnetic field strength
  trackFeature(afSensors)

proc getGravity*(input: InputManager): Vector3 =
  ## Get gravity vector
  trackFeature(afSensors)

proc getLinearAcceleration*(input: InputManager): Vector3 =
  ## Get linear acceleration (gravity removed)
  trackFeature(afSensors)

proc getOrientation*(input: InputManager): Vector3 =
  ## Get device orientation (pitch, roll, yaw)
  trackFeature(afSensors)

proc getRotationVector*(input: InputManager): Vector4 =
  ## Get rotation quaternion
  trackFeature(afSensors)

proc getStepCount*(input: InputManager): int32 =
  ## Get step count (if available)
  trackFeature(afSensors)

proc getProximity*(input: InputManager): float32 =
  ## Get proximity sensor value
  trackFeature(afSensors)

proc getLightLevel*(input: InputManager): float32 =
  ## Get ambient light level
  trackFeature(afSensors)

proc getTemperature*(input: InputManager): float32 =
  ## Get device temperature
  trackFeature(afSensors)

proc getHumidity*(input: InputManager): float32 =
  ## Get humidity level
  trackFeature(afSensors)

proc getPressure*(input: InputManager): float32 =
  ## Get atmospheric pressure
  trackFeature(afSensors)

# Sensor Callbacks
proc onAccelerationChanged*(input: InputManager, callback: proc(accel: Vector3)) =
  ## Set acceleration callback
  trackFeature(afSensors)

proc onGyroscopeChanged*(input: InputManager, callback: proc(gyro: Vector3)) =
  ## Set gyroscope callback
  trackFeature(afSensors)

proc onOrientationChanged*(input: InputManager, callback: proc(orientation: Vector3)) =
  ## Set orientation callback
  trackFeature(afSensors)

proc onShakeDetected*(input: InputManager, callback: proc(intensity: float32)) =
  ## Set shake detection callback
  trackFeature(afSensors)

# Input Configuration
proc setSensorUpdateRate*(input: InputManager, rate: int32) =
  ## Set sensor update rate (Hz)
  trackFeature(afSensors)

proc enableSensor*(input: InputManager, sensorType: string) =
  ## Enable specific sensor
  trackFeature(afSensors)

proc disableSensor*(input: InputManager, sensorType: string) =
  ## Disable specific sensor
  trackFeature(afSensors)

proc setTouchSensitivity*(input: InputManager, sensitivity: float32) =
  ## Set touch sensitivity
  discard

proc setGestureSensitivity*(input: InputManager, sensitivity: float32) =
  ## Set gesture sensitivity
  discard

# Convenience Functions
proc isTapped*(input: InputManager): bool =
  ## Check if screen was tapped this frame
  trackFeature(afInput)

proc getTapPosition*(input: InputManager): Vector2 =
  ## Get last tap position
  trackFeature(afInput)

proc isShaking*(input: InputManager): bool =
  ## Check if device is being shaken
  trackFeature(afSensors)

proc getShakeIntensity*(input: InputManager): float32 =
  ## Get shake intensity
  trackFeature(afSensors)

proc isFlat*(input: InputManager): bool =
  ## Check if device is lying flat
  trackFeature(afSensors)

proc isFaceUp*(input: InputManager): bool =
  ## Check if device is face up
  trackFeature(afSensors)

proc isFaceDown*(input: InputManager): bool =
  ## Check if device is face down
  trackFeature(afSensors)

proc isPortrait*(input: InputManager): bool =
  ## Check if device is in portrait orientation
  trackFeature(afSensors)

proc isLandscape*(input: InputManager): bool =
  ## Check if device is in landscape orientation
  trackFeature(afSensors)

# High-level Input Helpers
proc getMousePosition*(): Vector2 =
  ## Get mouse/touch position (unified)
  trackFeature(afInput)

proc isMousePressed*(button = 0): bool =
  ## Check if mouse/touch is pressed
  trackFeature(afInput)

proc wasMousePressed*(button = 0): bool =
  ## Check if mouse/touch was just pressed
  trackFeature(afInput)

proc wasMouseReleased*(button = 0): bool =
  ## Check if mouse/touch was just released
  trackFeature(afInput)