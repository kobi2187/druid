import jnim

jclass android.widget.VideoView* of SurfaceView:
  proc getAccessibilityClassName*(): CharSequence
  proc resolveAdjustedSize*(desiredSize: jint, measureSpec: jint): jint
  proc setVideoPath*(path: string)
  proc setVideoURI*(uri: Uri)
  proc setVideoURI*(uri: Uri, headers: Map[string, string])
  proc setAudioFocusRequest*(focusGain: jint)
  proc setAudioAttributes*(attributes: AudioAttributes)
  proc addSubtitleSource*(is: InputStream, format: MediaFormat)
  proc stopPlayback*()
  proc setMediaController*(controller: MediaController)
  proc setOnPreparedListener*(l: MediaPlayer.OnPreparedListener)
  proc setOnCompletionListener*(l: OnCompletionListener)
  proc setOnErrorListener*(l: OnErrorListener)
  proc setOnInfoListener*(l: OnInfoListener)
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc onTrackballEvent*(ev: MotionEvent): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc start*()
  proc pause*()
  proc suspend*()
  proc resume*()
  proc getDuration*(): jint
  proc getCurrentPosition*(): jint
  proc seekTo*(msec: jint)
  proc isPlaying*(): jboolean
  proc getBufferPercentage*(): jint
  proc canPause*(): jboolean
  proc canSeekBackward*(): jboolean
  proc canSeekForward*(): jboolean
  proc getAudioSessionId*(): jint
  proc draw*(canvas: Canvas)
  proc setSubtitleWidget*(subtitleWidget: RenderingWidget)
  proc getSubtitleLooper*(): Looper

