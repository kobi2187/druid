import jnim

jclass android.graphics.RenderNode* of JVMObject:
  proc create*(name: string, animationHost: AnimationHost): RenderNode {.`static`.}
  proc adopt*(nativePtr: jlong): RenderNode {.`static`.}
  proc addPositionUpdateListener*(listener: PositionUpdateListener)
  proc removePositionUpdateListener*(listener: PositionUpdateListener)
  proc beginRecording*(width: jint, height: jint): RecordingCanvas
  proc beginRecording*(): RecordingCanvas
  proc endRecording*()
  proc start*(width: jint, height: jint): RecordingCanvas
  proc end*(canvas: RecordingCanvas)
  proc discardDisplayList*()
  proc hasDisplayList*(): jboolean
  proc hasIdentityMatrix*(): jboolean
  proc getMatrix*(outMatrix: Matrix)
  proc getInverseMatrix*(outMatrix: Matrix)
  proc setLayerType*(layerType: jint): jboolean
  proc setLayerPaint*(paint: Paint): jboolean
  proc setUseCompositingLayer*(forceToLayer: jboolean, paint: Paint): jboolean
  proc getUseCompositingLayer*(): jboolean
  proc setClipRect*(rect: Rect): jboolean
  proc setClipToBounds*(clipToBounds: jboolean): jboolean
  proc getClipToBounds*(): jboolean
  proc setProjectBackwards*(shouldProject: jboolean): jboolean
  proc setProjectionReceiver*(shouldReceive: jboolean): jboolean
  proc setOutline*(outline: Outline): jboolean
  proc clearStretch*(): jboolean
  proc stretch*(vecX: jfloat, vecY: jfloat, maxStretchAmountX: jfloat, maxStretchAmountY: jfloat): jboolean
  proc hasShadow*(): jboolean
  proc setSpotShadowColor*(color: jint): jboolean
  proc getSpotShadowColor*(): jint
  proc setAmbientShadowColor*(color: jint): jboolean
  proc getAmbientShadowColor*(): jint
  proc setClipToOutline*(clipToOutline: jboolean): jboolean
  proc getClipToOutline*(): jboolean
  proc setRevealClip*(shouldClip: jboolean, x: jfloat, y: jfloat, radius: jfloat): jboolean
  proc setStaticMatrix*(matrix: Matrix): jboolean
  proc setAnimationMatrix*(matrix: Matrix): jboolean
  proc getAnimationMatrix*(): Matrix
  proc setAlpha*(alpha: jfloat): jboolean
  proc setRenderEffect*(renderEffect: RenderEffect): jboolean
  proc setBackdropRenderEffect*(renderEffect: RenderEffect): jboolean
  proc getAlpha*(): jfloat
  proc setHasOverlappingRendering*(hasOverlappingRendering: jboolean): jboolean
  proc setUsageHint*(usageHint: jint)
  proc hasOverlappingRendering*(): jboolean
  proc setElevation*(lift: jfloat): jboolean
  proc getElevation*(): jfloat
  proc setTranslationX*(translationX: jfloat): jboolean
  proc getTranslationX*(): jfloat
  proc setTranslationY*(translationY: jfloat): jboolean
  proc getTranslationY*(): jfloat
  proc setTranslationZ*(translationZ: jfloat): jboolean
  proc getTranslationZ*(): jfloat
  proc setRotationZ*(rotation: jfloat): jboolean
  proc getRotationZ*(): jfloat
  proc setRotationX*(rotationX: jfloat): jboolean
  proc getRotationX*(): jfloat
  proc setRotationY*(rotationY: jfloat): jboolean
  proc getRotationY*(): jfloat
  proc setScaleX*(scaleX: jfloat): jboolean
  proc getScaleX*(): jfloat
  proc setScaleY*(scaleY: jfloat): jboolean
  proc getScaleY*(): jfloat
  proc setPivotX*(pivotX: jfloat): jboolean
  proc getPivotX*(): jfloat
  proc setPivotY*(pivotY: jfloat): jboolean
  proc getPivotY*(): jfloat
  proc isPivotExplicitlySet*(): jboolean
  proc resetPivot*(): jboolean
  proc setCameraDistance*(distance: jfloat): jboolean
  proc getCameraDistance*(): jfloat
  proc setLeft*(left: jint): jboolean
  proc setTop*(top: jint): jboolean
  proc setRight*(right: jint): jboolean
  proc setBottom*(bottom: jint): jboolean
  proc getLeft*(): jint
  proc getTop*(): jint
  proc getRight*(): jint
  proc getBottom*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc setLeftTopRightBottom*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc setPosition*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc setPosition*(position: Rect): jboolean
  proc offsetLeftAndRight*(offset: jint): jboolean
  proc offsetTopAndBottom*(offset: jint): jboolean
  proc output*()
  proc computeApproximateMemoryUsage*(): jlong
  proc computeApproximateMemoryAllocated*(): jlong
  proc setForceDarkAllowed*(allow: jboolean): jboolean
  proc isForceDarkAllowed*(): jboolean
  proc getUniqueId*(): jlong
  proc setIsTextureView*()
  proc addAnimator*(animator: RenderNodeAnimator)
  proc isAttached*(): jboolean
  proc registerVectorDrawableAnimator*(animatorSet: NativeVectorDrawableAnimator)
  proc endAllAnimators*()
  proc forceEndAnimators*()
  mNativeRenderNode*: jlong
  USAGE_UNKNOWN*: jint {.`static`.}
  USAGE_BACKGROUND*: jint {.`static`.}


