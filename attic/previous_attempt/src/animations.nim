# animations.nim - Animation utilities

import android, options

type
  AnimationType* = enum
    Alpha, Scale, Translate, Rotate, Set
    
  Interpolator* = enum
    Linear, Accelerate, Decelerate, AccelerateDecelerate,
    Anticipate, Overshoot, AnticipateOvershoot,
    Bounce, Cycle, Path
    
  AnimationProps* = object
    ## Base animation properties
    duration*: int            # milliseconds
    startDelay*: int          # milliseconds
    interpolator*: Interpolator
    repeatCount*: int         # -1 for infinite
    repeatMode*: int          # 1=restart, 2=reverse
    
  AlphaAnimation* = object
    fromAlpha*: float         # 0.0-1.0
    toAlpha*: float           # 0.0-1.0
    props*: AnimationProps
    
  ScaleAnimation* = object
    fromScaleX*: float
    toScaleX*: float
    fromScaleY*: float
    toScaleY*: float
    pivotX*: float            # 0.0-1.0 or absolute
    pivotY*: float            # 0.0-1.0 or absolute
    props*: AnimationProps
    
  TranslateAnimation* = object
    fromX*: float
    toX*: float
    fromY*: float
    toY*: float
    props*: AnimationProps
    
  RotateAnimation* = object
    fromDegrees*: float
    toDegrees*: float
    pivotX*: float            # 0.0-1.0 or absolute
    pivotY*: float            # 0.0-1.0 or absolute
    props*: AnimationProps
    
  AnimationSet* = object
    animations*: seq[AnimationType]
    shareInterpolator*: bool
    props*: AnimationProps
    
  AnimationListener* = object
    onStart*: Option[proc()]
    onEnd*: Option[proc()]
    onRepeat*: Option[proc()]
    onCancel*: Option[proc()]
    
  AnimatorType* = enum
    ValueAnimator, ObjectAnimator, AnimatorSet
    
  PropertyValType* = enum
    Int, Float, Color
    
  PropertyAnimation* = object
    case animType*: AnimatorType
    of ValueAnimator:
      case valType*: PropertyValType
      of Int:
        intFromVal*: int
        intToVal*: int
      of Float:
        floatFromVal*: float
        floatToVal*: float
      of Color:
        colorFromVal*: int
        colorToVal*: int
    of ObjectAnimator:
      propertyName*: string
      propertyHolder*: pointer  # JNI reference
      case propValType*: PropertyValType
      of Int:
        intFromValue*: int
        intToValue*: int
      of Float:
        floatFromValue*: float
        floatToValue*: float
      of Color:
        colorFromValue*: int
        colorToValue*: int
    of AnimatorSet:
      animators*: seq[PropertyAnimation]
      playTogether*: bool
    props*: AnimationProps
    
  AnimationManager* = ref object of Manager
    viewAnimations: Table[string, tuple[viewId: pointer, animation: pointer]]
    propertyAnimations: Table[string, pointer]
    listeners: Table[string, AnimationListener]

# Constructor
proc newAnimationManager*(context: Context): AnimationManager
  ## Creates a new animation manager

# View animations
proc createAlphaAnimation*(m: AnimationManager, anim: AlphaAnimation): string
  ## Creates alpha animation
  ## Returns animation ID
  ## API 26+: Uses AlphaAnimation
  
proc createScaleAnimation*(m: AnimationManager, anim: ScaleAnimation): string
  ## Creates scale animation
  ## Returns animation ID
  ## API 26+: Uses ScaleAnimation
  
proc createTranslateAnimation*(m: AnimationManager, anim: TranslateAnimation): string
  ## Creates translate animation
  ## Returns animation ID
  ## API 26+: Uses TranslateAnimation
  
proc createRotateAnimation*(m: AnimationManager, anim: RotateAnimation): string
  ## Creates rotate animation
  ## Returns animation ID
  ## API 26+: Uses RotateAnimation
  
proc createAnimationSet*(m: AnimationManager, 
                       animSet: AnimationSet): string
  ## Creates animation set
  ## Returns animation ID
  ## API 26+: Uses AnimationSet

# Property animations
proc createValueAnimator*(m: AnimationManager, 
                        anim: PropertyAnimation): string
  ## Creates value animator
  ## Returns animator ID
  ## API 26+: Uses ValueAnimator
  
proc createObjectAnimator*(m: AnimationManager, 
                         anim: PropertyAnimation): string
  ## Creates object animator
  ## Returns animator ID
  ## API 26+: Uses ObjectAnimator
  
proc createAnimatorSet*(m: AnimationManager, 
                      anim: PropertyAnimation): string
  ## Creates animator set
  ## Returns animator ID
  ## API 26+: Uses AnimatorSet

# Animation control
proc startAnimation*(m: AnimationManager, 
                   animId: string, 
                   viewId: pointer,
                   listener: Option[AnimationListener] = none(AnimationListener)): bool
  ## Starts view animation
  ## API 26+: Uses view.startAnimation
  
proc startAnimator*(m: AnimationManager, 
                  animatorId: string,
                  listener: Option[AnimationListener] = none(AnimationListener)): bool
  ## Starts property animator
  ## API 26+: Uses Animator.start
  
proc cancelAnimation*(m: AnimationManager, animId: string): bool
  ## Cancels animation
  ## API 26+: Uses Animation.cancel
  
proc cancelAnimator*(m: AnimationManager, animatorId: string): bool
  ## Cancels animator
  ## API 26+: Uses Animator.cancel
  
proc isPaused*(m: AnimationManager, animatorId: string): bool
  ## Checks if animator is paused
  ## API 26+: Uses Animator.isPaused
  
proc isRunning*(m: AnimationManager, animatorId: string): bool
  ## Checks if animator is running
  ## API 26+: Uses Animator.isRunning