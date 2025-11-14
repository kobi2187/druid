import jnim

jclass android.view.KeyEvent* of InputEvent:
  proc getMaxKeyCode*(): jint {.`static`.}
  proc getDeadChar*(accent: jint, c: jint): jint {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, code: jint, repeat: jint, metaState: jint, deviceId: jint, scanCode: jint, flags: jint, source: jint, displayId: jint, characters: string): KeyEvent {.`static`.}
  proc obtain*(downTime: jlong, eventTime: jlong, action: jint, code: jint, repeat: jint, metaState: jint, deviceId: jint, scancode: jint, flags: jint, source: jint, characters: string): KeyEvent {.`static`.}
  proc obtain*(other: KeyEvent): KeyEvent {.`static`.}
  proc copy*(): KeyEvent
  proc recycle*()
  proc recycleIfNeededAfterDispatch*()
  proc getId*(): jint
  proc changeTimeRepeat*(event: KeyEvent, eventTime: jlong, newRepeat: jint): KeyEvent {.`static`.}
  proc changeTimeRepeat*(event: KeyEvent, eventTime: jlong, newRepeat: jint, newFlags: jint): KeyEvent {.`static`.}
  proc changeAction*(event: KeyEvent, action: jint): KeyEvent {.`static`.}
  proc changeFlags*(event: KeyEvent, flags: jint): KeyEvent {.`static`.}
  proc isTainted*(): jboolean
  proc setTainted*(tainted: jboolean)
  proc isDown*(): jboolean
  proc isSystem*(): jboolean
  proc isWakeKey*(): jboolean
  proc isGamepadButton*(keyCode: jint): jboolean {.`static`.}
  proc isConfirmKey*(keyCode: jint): jboolean {.`static`.}
  proc isMediaSessionKey*(keyCode: jint): jboolean {.`static`.}
  proc isSystemKey*(keyCode: jint): jboolean {.`static`.}
  proc isWakeKey*(keyCode: jint): jboolean {.`static`.}
  proc isMetaKey*(keyCode: jint): jboolean {.`static`.}
  proc isAltKey*(keyCode: jint): jboolean {.`static`.}
  proc isVisibleBackgroundUserAllowedKey*(keyCode: jint): jboolean {.`static`.}
  proc getDeviceId*(): jint
  proc getSource*(): jint
  proc setSource*(source: jint)
  proc getDisplayId*(): jint
  proc setDisplayId*(displayId: jint)
  proc getMetaState*(): jint
  proc getModifiers*(): jint
  proc setFlags*(newFlags: jint)
  proc getFlags*(): jint
  proc getModifierMetaStateMask*(): jint {.`static`.}
  proc isModifierKey*(keyCode: jint): jboolean {.`static`.}
  proc normalizeMetaState*(metaState: jint): jint {.`static`.}
  proc metaStateHasNoModifiers*(metaState: jint): jboolean {.`static`.}
  proc metaStateHasModifiers*(metaState: jint, modifiers: jint): jboolean {.`static`.}
  proc hasNoModifiers*(): jboolean
  proc hasModifiers*(modifiers: jint): jboolean
  proc isAltPressed*(): jboolean
  proc isShiftPressed*(): jboolean
  proc isSymPressed*(): jboolean
  proc isCtrlPressed*(): jboolean
  proc isMetaPressed*(): jboolean
  proc isFunctionPressed*(): jboolean
  proc isCapsLockOn*(): jboolean
  proc isNumLockOn*(): jboolean
  proc isScrollLockOn*(): jboolean
  proc getAction*(): jint
  proc isCanceled*(): jboolean
  proc cancel*()
  proc startTracking*()
  proc isTracking*(): jboolean
  proc isLongPress*(): jboolean
  proc getKeyCode*(): jint
  proc getCharacters*(): string
  proc getScanCode*(): jint
  proc getRepeatCount*(): jint
  proc setTime*(downTime: jlong, eventTime: jlong)
  proc getDownTime*(): jlong
  proc getEventTime*(): jlong
  proc getEventTimeNanos*(): jlong
  proc getKeyboardDevice*(): jint
  proc getKeyCharacterMap*(): KeyCharacterMap
  proc getDisplayLabel*(): jchar
  proc getUnicodeChar*(): jint
  proc getUnicodeChar*(metaState: jint): jint
  proc getKeyData*(results: KeyData): jboolean
  proc getMatch*(chars: seq[jchar]): jchar
  proc getMatch*(chars: seq[jchar], metaState: jint): jchar
  proc getNumber*(): jchar
  proc isPrintingKey*(): jboolean
  proc dispatch*(receiver: Callback): jboolean
  proc dispatch*(receiver: Callback, state: DispatcherState, target: JObject): jboolean
  proc toString*(): string
  proc actionToString*(action: jint): string {.`static`.}
  proc keyCodeToString*(keyCode: jint): string {.`static`.}
  proc keyCodeFromString*(symbolicName: string): jint {.`static`.}
  proc metaStateToString*(metaState: jint): string {.`static`.}
  proc createFromParcelBody*(in: Parcel): KeyEvent {.`static`.}
  proc writeToParcel*(output:Parcel, flags: jint)
  KEYCODE_UNKNOWN*: jint {.`static`.}
  KEYCODE_SOFT_LEFT*: jint {.`static`.}
  KEYCODE_SOFT_RIGHT*: jint {.`static`.}
  KEYCODE_HOME*: jint {.`static`.}
  KEYCODE_BACK*: jint {.`static`.}
  KEYCODE_CALL*: jint {.`static`.}
  KEYCODE_ENDCALL*: jint {.`static`.}
  KEYCODE_0*: jint {.`static`.}
  KEYCODE_1*: jint {.`static`.}
  KEYCODE_2*: jint {.`static`.}
  KEYCODE_3*: jint {.`static`.}
  KEYCODE_4*: jint {.`static`.}
  KEYCODE_5*: jint {.`static`.}
  KEYCODE_6*: jint {.`static`.}
  KEYCODE_7*: jint {.`static`.}
  KEYCODE_8*: jint {.`static`.}
  KEYCODE_9*: jint {.`static`.}
  KEYCODE_STAR*: jint {.`static`.}
  KEYCODE_POUND*: jint {.`static`.}
  KEYCODE_DPAD_UP*: jint {.`static`.}
  KEYCODE_DPAD_DOWN*: jint {.`static`.}
  KEYCODE_DPAD_LEFT*: jint {.`static`.}
  KEYCODE_DPAD_RIGHT*: jint {.`static`.}
  KEYCODE_DPAD_CENTER*: jint {.`static`.}
  KEYCODE_VOLUME_UP*: jint {.`static`.}
  KEYCODE_VOLUME_DOWN*: jint {.`static`.}
  KEYCODE_POWER*: jint {.`static`.}
  KEYCODE_CAMERA*: jint {.`static`.}
  KEYCODE_CLEAR*: jint {.`static`.}
  KEYCODE_A*: jint {.`static`.}
  KEYCODE_B*: jint {.`static`.}
  KEYCODE_C*: jint {.`static`.}
  KEYCODE_D*: jint {.`static`.}
  KEYCODE_E*: jint {.`static`.}
  KEYCODE_F*: jint {.`static`.}
  KEYCODE_G*: jint {.`static`.}
  KEYCODE_H*: jint {.`static`.}
  KEYCODE_I*: jint {.`static`.}
  KEYCODE_J*: jint {.`static`.}
  KEYCODE_K*: jint {.`static`.}
  KEYCODE_L*: jint {.`static`.}
  KEYCODE_M*: jint {.`static`.}
  KEYCODE_N*: jint {.`static`.}
  KEYCODE_O*: jint {.`static`.}
  KEYCODE_P*: jint {.`static`.}
  KEYCODE_Q*: jint {.`static`.}
  KEYCODE_R*: jint {.`static`.}
  KEYCODE_S*: jint {.`static`.}
  KEYCODE_T*: jint {.`static`.}
  KEYCODE_U*: jint {.`static`.}
  KEYCODE_V*: jint {.`static`.}
  KEYCODE_W*: jint {.`static`.}
  KEYCODE_X*: jint {.`static`.}
  KEYCODE_Y*: jint {.`static`.}
  KEYCODE_Z*: jint {.`static`.}
  KEYCODE_COMMA*: jint {.`static`.}
  KEYCODE_PERIOD*: jint {.`static`.}
  KEYCODE_ALT_LEFT*: jint {.`static`.}
  KEYCODE_ALT_RIGHT*: jint {.`static`.}
  KEYCODE_SHIFT_LEFT*: jint {.`static`.}
  KEYCODE_SHIFT_RIGHT*: jint {.`static`.}
  KEYCODE_TAB*: jint {.`static`.}
  KEYCODE_SPACE*: jint {.`static`.}
  KEYCODE_SYM*: jint {.`static`.}
  KEYCODE_EXPLORER*: jint {.`static`.}
  KEYCODE_ENVELOPE*: jint {.`static`.}
  KEYCODE_ENTER*: jint {.`static`.}
  KEYCODE_DEL*: jint {.`static`.}
  KEYCODE_GRAVE*: jint {.`static`.}
  KEYCODE_MINUS*: jint {.`static`.}
  KEYCODE_EQUALS*: jint {.`static`.}
  KEYCODE_LEFT_BRACKET*: jint {.`static`.}
  KEYCODE_RIGHT_BRACKET*: jint {.`static`.}
  KEYCODE_BACKSLASH*: jint {.`static`.}
  KEYCODE_SEMICOLON*: jint {.`static`.}
  KEYCODE_APOSTROPHE*: jint {.`static`.}
  KEYCODE_SLASH*: jint {.`static`.}
  KEYCODE_AT*: jint {.`static`.}
  KEYCODE_NUM*: jint {.`static`.}
  KEYCODE_HEADSETHOOK*: jint {.`static`.}
  KEYCODE_FOCUS*: jint {.`static`.}
  KEYCODE_PLUS*: jint {.`static`.}
  KEYCODE_MENU*: jint {.`static`.}
  KEYCODE_NOTIFICATION*: jint {.`static`.}
  KEYCODE_SEARCH*: jint {.`static`.}
  KEYCODE_MEDIA_PLAY_PAUSE*: jint {.`static`.}
  KEYCODE_MEDIA_STOP*: jint {.`static`.}
  KEYCODE_MEDIA_NEXT*: jint {.`static`.}
  KEYCODE_MEDIA_PREVIOUS*: jint {.`static`.}
  KEYCODE_MEDIA_REWIND*: jint {.`static`.}
  KEYCODE_MEDIA_FAST_FORWARD*: jint {.`static`.}
  KEYCODE_MUTE*: jint {.`static`.}
  KEYCODE_PAGE_UP*: jint {.`static`.}
  KEYCODE_PAGE_DOWN*: jint {.`static`.}
  KEYCODE_PICTSYMBOLS*: jint {.`static`.}
  KEYCODE_SWITCH_CHARSET*: jint {.`static`.}
  KEYCODE_BUTTON_A*: jint {.`static`.}
  KEYCODE_BUTTON_B*: jint {.`static`.}
  KEYCODE_BUTTON_C*: jint {.`static`.}
  KEYCODE_BUTTON_X*: jint {.`static`.}
  KEYCODE_BUTTON_Y*: jint {.`static`.}
  KEYCODE_BUTTON_Z*: jint {.`static`.}
  KEYCODE_BUTTON_L1*: jint {.`static`.}
  KEYCODE_BUTTON_R1*: jint {.`static`.}
  KEYCODE_BUTTON_L2*: jint {.`static`.}
  KEYCODE_BUTTON_R2*: jint {.`static`.}
  KEYCODE_BUTTON_THUMBL*: jint {.`static`.}
  KEYCODE_BUTTON_THUMBR*: jint {.`static`.}
  KEYCODE_BUTTON_START*: jint {.`static`.}
  KEYCODE_BUTTON_SELECT*: jint {.`static`.}
  KEYCODE_BUTTON_MODE*: jint {.`static`.}
  KEYCODE_ESCAPE*: jint {.`static`.}
  KEYCODE_FORWARD_DEL*: jint {.`static`.}
  KEYCODE_CTRL_LEFT*: jint {.`static`.}
  KEYCODE_CTRL_RIGHT*: jint {.`static`.}
  KEYCODE_CAPS_LOCK*: jint {.`static`.}
  KEYCODE_SCROLL_LOCK*: jint {.`static`.}
  KEYCODE_META_LEFT*: jint {.`static`.}
  KEYCODE_META_RIGHT*: jint {.`static`.}
  KEYCODE_FUNCTION*: jint {.`static`.}
  KEYCODE_SYSRQ*: jint {.`static`.}
  KEYCODE_BREAK*: jint {.`static`.}
  KEYCODE_MOVE_HOME*: jint {.`static`.}
  KEYCODE_MOVE_END*: jint {.`static`.}
  KEYCODE_INSERT*: jint {.`static`.}
  KEYCODE_FORWARD*: jint {.`static`.}
  KEYCODE_MEDIA_PLAY*: jint {.`static`.}
  KEYCODE_MEDIA_PAUSE*: jint {.`static`.}
  KEYCODE_MEDIA_CLOSE*: jint {.`static`.}
  KEYCODE_MEDIA_EJECT*: jint {.`static`.}
  KEYCODE_MEDIA_RECORD*: jint {.`static`.}
  KEYCODE_F1*: jint {.`static`.}
  KEYCODE_F2*: jint {.`static`.}
  KEYCODE_F3*: jint {.`static`.}
  KEYCODE_F4*: jint {.`static`.}
  KEYCODE_F5*: jint {.`static`.}
  KEYCODE_F6*: jint {.`static`.}
  KEYCODE_F7*: jint {.`static`.}
  KEYCODE_F8*: jint {.`static`.}
  KEYCODE_F9*: jint {.`static`.}
  KEYCODE_F10*: jint {.`static`.}
  KEYCODE_F11*: jint {.`static`.}
  KEYCODE_F12*: jint {.`static`.}
  KEYCODE_NUM_LOCK*: jint {.`static`.}
  KEYCODE_NUMPAD_0*: jint {.`static`.}
  KEYCODE_NUMPAD_1*: jint {.`static`.}
  KEYCODE_NUMPAD_2*: jint {.`static`.}
  KEYCODE_NUMPAD_3*: jint {.`static`.}
  KEYCODE_NUMPAD_4*: jint {.`static`.}
  KEYCODE_NUMPAD_5*: jint {.`static`.}
  KEYCODE_NUMPAD_6*: jint {.`static`.}
  KEYCODE_NUMPAD_7*: jint {.`static`.}
  KEYCODE_NUMPAD_8*: jint {.`static`.}
  KEYCODE_NUMPAD_9*: jint {.`static`.}
  KEYCODE_NUMPAD_DIVIDE*: jint {.`static`.}
  KEYCODE_NUMPAD_MULTIPLY*: jint {.`static`.}
  KEYCODE_NUMPAD_SUBTRACT*: jint {.`static`.}
  KEYCODE_NUMPAD_ADD*: jint {.`static`.}
  KEYCODE_NUMPAD_DOT*: jint {.`static`.}
  KEYCODE_NUMPAD_COMMA*: jint {.`static`.}
  KEYCODE_NUMPAD_ENTER*: jint {.`static`.}
  KEYCODE_NUMPAD_EQUALS*: jint {.`static`.}
  KEYCODE_NUMPAD_LEFT_PAREN*: jint {.`static`.}
  KEYCODE_NUMPAD_RIGHT_PAREN*: jint {.`static`.}
  KEYCODE_VOLUME_MUTE*: jint {.`static`.}
  KEYCODE_INFO*: jint {.`static`.}
  KEYCODE_CHANNEL_UP*: jint {.`static`.}
  KEYCODE_CHANNEL_DOWN*: jint {.`static`.}
  KEYCODE_ZOOM_IN*: jint {.`static`.}
  KEYCODE_ZOOM_OUT*: jint {.`static`.}
  KEYCODE_TV*: jint {.`static`.}
  KEYCODE_WINDOW*: jint {.`static`.}
  KEYCODE_GUIDE*: jint {.`static`.}
  KEYCODE_DVR*: jint {.`static`.}
  KEYCODE_BOOKMARK*: jint {.`static`.}
  KEYCODE_CAPTIONS*: jint {.`static`.}
  KEYCODE_SETTINGS*: jint {.`static`.}
  KEYCODE_TV_POWER*: jint {.`static`.}
  KEYCODE_TV_INPUT*: jint {.`static`.}
  KEYCODE_STB_POWER*: jint {.`static`.}
  KEYCODE_STB_INPUT*: jint {.`static`.}
  KEYCODE_AVR_POWER*: jint {.`static`.}
  KEYCODE_AVR_INPUT*: jint {.`static`.}
  KEYCODE_PROG_RED*: jint {.`static`.}
  KEYCODE_PROG_GREEN*: jint {.`static`.}
  KEYCODE_PROG_YELLOW*: jint {.`static`.}
  KEYCODE_PROG_BLUE*: jint {.`static`.}
  KEYCODE_APP_SWITCH*: jint {.`static`.}
  KEYCODE_BUTTON_1*: jint {.`static`.}
  KEYCODE_BUTTON_2*: jint {.`static`.}
  KEYCODE_BUTTON_3*: jint {.`static`.}
  KEYCODE_BUTTON_4*: jint {.`static`.}
  KEYCODE_BUTTON_5*: jint {.`static`.}
  KEYCODE_BUTTON_6*: jint {.`static`.}
  KEYCODE_BUTTON_7*: jint {.`static`.}
  KEYCODE_BUTTON_8*: jint {.`static`.}
  KEYCODE_BUTTON_9*: jint {.`static`.}
  KEYCODE_BUTTON_10*: jint {.`static`.}
  KEYCODE_BUTTON_11*: jint {.`static`.}
  KEYCODE_BUTTON_12*: jint {.`static`.}
  KEYCODE_BUTTON_13*: jint {.`static`.}
  KEYCODE_BUTTON_14*: jint {.`static`.}
  KEYCODE_BUTTON_15*: jint {.`static`.}
  KEYCODE_BUTTON_16*: jint {.`static`.}
  KEYCODE_LANGUAGE_SWITCH*: jint {.`static`.}
  KEYCODE_MANNER_MODE*: jint {.`static`.}
  KEYCODE_3D_MODE*: jint {.`static`.}
  KEYCODE_CONTACTS*: jint {.`static`.}
  KEYCODE_CALENDAR*: jint {.`static`.}
  KEYCODE_MUSIC*: jint {.`static`.}
  KEYCODE_CALCULATOR*: jint {.`static`.}
  KEYCODE_ZENKAKU_HANKAKU*: jint {.`static`.}
  KEYCODE_EISU*: jint {.`static`.}
  KEYCODE_MUHENKAN*: jint {.`static`.}
  KEYCODE_HENKAN*: jint {.`static`.}
  KEYCODE_KATAKANA_HIRAGANA*: jint {.`static`.}
  KEYCODE_YEN*: jint {.`static`.}
  KEYCODE_RO*: jint {.`static`.}
  KEYCODE_KANA*: jint {.`static`.}
  KEYCODE_ASSIST*: jint {.`static`.}
  KEYCODE_BRIGHTNESS_DOWN*: jint {.`static`.}
  KEYCODE_BRIGHTNESS_UP*: jint {.`static`.}
  KEYCODE_MEDIA_AUDIO_TRACK*: jint {.`static`.}
  KEYCODE_SLEEP*: jint {.`static`.}
  KEYCODE_WAKEUP*: jint {.`static`.}
  KEYCODE_PAIRING*: jint {.`static`.}
  KEYCODE_MEDIA_TOP_MENU*: jint {.`static`.}
  KEYCODE_11*: jint {.`static`.}
  KEYCODE_12*: jint {.`static`.}
  KEYCODE_LAST_CHANNEL*: jint {.`static`.}
  KEYCODE_TV_DATA_SERVICE*: jint {.`static`.}
  KEYCODE_VOICE_ASSIST*: jint {.`static`.}
  KEYCODE_TV_RADIO_SERVICE*: jint {.`static`.}
  KEYCODE_TV_TELETEXT*: jint {.`static`.}
  KEYCODE_TV_NUMBER_ENTRY*: jint {.`static`.}
  KEYCODE_TV_TERRESTRIAL_ANALOG*: jint {.`static`.}
  KEYCODE_TV_TERRESTRIAL_DIGITAL*: jint {.`static`.}
  KEYCODE_TV_SATELLITE*: jint {.`static`.}
  KEYCODE_TV_SATELLITE_BS*: jint {.`static`.}
  KEYCODE_TV_SATELLITE_CS*: jint {.`static`.}
  KEYCODE_TV_SATELLITE_SERVICE*: jint {.`static`.}
  KEYCODE_TV_NETWORK*: jint {.`static`.}
  KEYCODE_TV_ANTENNA_CABLE*: jint {.`static`.}
  KEYCODE_TV_INPUT_HDMI_1*: jint {.`static`.}
  KEYCODE_TV_INPUT_HDMI_2*: jint {.`static`.}
  KEYCODE_TV_INPUT_HDMI_3*: jint {.`static`.}
  KEYCODE_TV_INPUT_HDMI_4*: jint {.`static`.}
  KEYCODE_TV_INPUT_COMPOSITE_1*: jint {.`static`.}
  KEYCODE_TV_INPUT_COMPOSITE_2*: jint {.`static`.}
  KEYCODE_TV_INPUT_COMPONENT_1*: jint {.`static`.}
  KEYCODE_TV_INPUT_COMPONENT_2*: jint {.`static`.}
  KEYCODE_TV_INPUT_VGA_1*: jint {.`static`.}
  KEYCODE_TV_AUDIO_DESCRIPTION*: jint {.`static`.}
  KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP*: jint {.`static`.}
  KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN*: jint {.`static`.}
  KEYCODE_TV_ZOOM_MODE*: jint {.`static`.}
  KEYCODE_TV_CONTENTS_MENU*: jint {.`static`.}
  KEYCODE_TV_MEDIA_CONTEXT_MENU*: jint {.`static`.}
  KEYCODE_TV_TIMER_PROGRAMMING*: jint {.`static`.}
  KEYCODE_HELP*: jint {.`static`.}
  KEYCODE_NAVIGATE_PREVIOUS*: jint {.`static`.}
  KEYCODE_NAVIGATE_NEXT*: jint {.`static`.}
  KEYCODE_NAVIGATE_IN*: jint {.`static`.}
  KEYCODE_NAVIGATE_OUT*: jint {.`static`.}
  KEYCODE_STEM_PRIMARY*: jint {.`static`.}
  KEYCODE_STEM_1*: jint {.`static`.}
  KEYCODE_STEM_2*: jint {.`static`.}
  KEYCODE_STEM_3*: jint {.`static`.}
  KEYCODE_DPAD_UP_LEFT*: jint {.`static`.}
  KEYCODE_DPAD_DOWN_LEFT*: jint {.`static`.}
  KEYCODE_DPAD_UP_RIGHT*: jint {.`static`.}
  KEYCODE_DPAD_DOWN_RIGHT*: jint {.`static`.}
  KEYCODE_MEDIA_SKIP_FORWARD*: jint {.`static`.}
  KEYCODE_MEDIA_SKIP_BACKWARD*: jint {.`static`.}
  KEYCODE_MEDIA_STEP_FORWARD*: jint {.`static`.}
  KEYCODE_MEDIA_STEP_BACKWARD*: jint {.`static`.}
  KEYCODE_SOFT_SLEEP*: jint {.`static`.}
  KEYCODE_CUT*: jint {.`static`.}
  KEYCODE_COPY*: jint {.`static`.}
  KEYCODE_PASTE*: jint {.`static`.}
  KEYCODE_SYSTEM_NAVIGATION_UP*: jint {.`static`.}
  KEYCODE_SYSTEM_NAVIGATION_DOWN*: jint {.`static`.}
  KEYCODE_SYSTEM_NAVIGATION_LEFT*: jint {.`static`.}
  KEYCODE_SYSTEM_NAVIGATION_RIGHT*: jint {.`static`.}
  KEYCODE_ALL_APPS*: jint {.`static`.}
  KEYCODE_REFRESH*: jint {.`static`.}
  KEYCODE_THUMBS_UP*: jint {.`static`.}
  KEYCODE_THUMBS_DOWN*: jint {.`static`.}
  KEYCODE_PROFILE_SWITCH*: jint {.`static`.}
  KEYCODE_VIDEO_APP_1*: jint {.`static`.}
  KEYCODE_VIDEO_APP_2*: jint {.`static`.}
  KEYCODE_VIDEO_APP_3*: jint {.`static`.}
  KEYCODE_VIDEO_APP_4*: jint {.`static`.}
  KEYCODE_VIDEO_APP_5*: jint {.`static`.}
  KEYCODE_VIDEO_APP_6*: jint {.`static`.}
  KEYCODE_VIDEO_APP_7*: jint {.`static`.}
  KEYCODE_VIDEO_APP_8*: jint {.`static`.}
  KEYCODE_FEATURED_APP_1*: jint {.`static`.}
  KEYCODE_FEATURED_APP_2*: jint {.`static`.}
  KEYCODE_FEATURED_APP_3*: jint {.`static`.}
  KEYCODE_FEATURED_APP_4*: jint {.`static`.}
  KEYCODE_DEMO_APP_1*: jint {.`static`.}
  KEYCODE_DEMO_APP_2*: jint {.`static`.}
  KEYCODE_DEMO_APP_3*: jint {.`static`.}
  KEYCODE_DEMO_APP_4*: jint {.`static`.}
  KEYCODE_KEYBOARD_BACKLIGHT_DOWN*: jint {.`static`.}
  KEYCODE_KEYBOARD_BACKLIGHT_UP*: jint {.`static`.}
  KEYCODE_KEYBOARD_BACKLIGHT_TOGGLE*: jint {.`static`.}
  KEYCODE_STYLUS_BUTTON_PRIMARY*: jint {.`static`.}
  KEYCODE_STYLUS_BUTTON_SECONDARY*: jint {.`static`.}
  KEYCODE_STYLUS_BUTTON_TERTIARY*: jint {.`static`.}
  KEYCODE_STYLUS_BUTTON_TAIL*: jint {.`static`.}
  KEYCODE_RECENT_APPS*: jint {.`static`.}
  KEYCODE_MACRO_1*: jint {.`static`.}
  KEYCODE_MACRO_2*: jint {.`static`.}
  KEYCODE_MACRO_3*: jint {.`static`.}
  KEYCODE_MACRO_4*: jint {.`static`.}
  KEYCODE_EMOJI_PICKER*: jint {.`static`.}
  KEYCODE_SCREENSHOT*: jint {.`static`.}
  KEYCODE_DICTATE*: jint {.`static`.}
  KEYCODE_NEW*: jint {.`static`.}
  KEYCODE_CLOSE*: jint {.`static`.}
  KEYCODE_DO_NOT_DISTURB*: jint {.`static`.}
  KEYCODE_PRINT*: jint {.`static`.}
  KEYCODE_LOCK*: jint {.`static`.}
  KEYCODE_FULLSCREEN*: jint {.`static`.}
  KEYCODE_F13*: jint {.`static`.}
  KEYCODE_F14*: jint {.`static`.}
  KEYCODE_F15*: jint {.`static`.}
  KEYCODE_F16*: jint {.`static`.}
  KEYCODE_F17*: jint {.`static`.}
  KEYCODE_F18*: jint {.`static`.}
  KEYCODE_F19*: jint {.`static`.}
  KEYCODE_F20*: jint {.`static`.}
  KEYCODE_F21*: jint {.`static`.}
  KEYCODE_F22*: jint {.`static`.}
  KEYCODE_F23*: jint {.`static`.}
  KEYCODE_F24*: jint {.`static`.}
  LAST_KEYCODE*: jint {.`static`.}
  MAX_KEYCODE*: jint {.`static`.}
  ACTION_DOWN*: jint {.`static`.}
  ACTION_UP*: jint {.`static`.}
  ACTION_MULTIPLE*: jint {.`static`.}
  META_CAP_LOCKED*: jint {.`static`.}
  META_ALT_LOCKED*: jint {.`static`.}
  META_SYM_LOCKED*: jint {.`static`.}
  META_SELECTING*: jint {.`static`.}
  META_ALT_ON*: jint {.`static`.}
  META_ALT_LEFT_ON*: jint {.`static`.}
  META_ALT_RIGHT_ON*: jint {.`static`.}
  META_SHIFT_ON*: jint {.`static`.}
  META_SHIFT_LEFT_ON*: jint {.`static`.}
  META_SHIFT_RIGHT_ON*: jint {.`static`.}
  META_SYM_ON*: jint {.`static`.}
  META_FUNCTION_ON*: jint {.`static`.}
  META_CTRL_ON*: jint {.`static`.}
  META_CTRL_LEFT_ON*: jint {.`static`.}
  META_CTRL_RIGHT_ON*: jint {.`static`.}
  META_META_ON*: jint {.`static`.}
  META_META_LEFT_ON*: jint {.`static`.}
  META_META_RIGHT_ON*: jint {.`static`.}
  META_CAPS_LOCK_ON*: jint {.`static`.}
  META_NUM_LOCK_ON*: jint {.`static`.}
  META_SCROLL_LOCK_ON*: jint {.`static`.}
  META_SHIFT_MASK*: jint {.`static`.}
  META_ALT_MASK*: jint {.`static`.}
  META_CTRL_MASK*: jint {.`static`.}
  META_META_MASK*: jint {.`static`.}
  FLAG_WOKE_HERE*: jint {.`static`.}
  FLAG_SOFT_KEYBOARD*: jint {.`static`.}
  FLAG_KEEP_TOUCH_MODE*: jint {.`static`.}
  FLAG_FROM_SYSTEM*: jint {.`static`.}
  FLAG_EDITOR_ACTION*: jint {.`static`.}
  FLAG_CANCELED*: jint {.`static`.}
  FLAG_VIRTUAL_HARD_KEY*: jint {.`static`.}
  FLAG_LONG_PRESS*: jint {.`static`.}
  FLAG_CANCELED_LONG_PRESS*: jint {.`static`.}
  FLAG_TRACKING*: jint {.`static`.}
  FLAG_FALLBACK*: jint {.`static`.}
  FLAG_IS_ACCESSIBILITY_EVENT*: jint {.`static`.}
  FLAG_PREDISPATCH*: jint {.`static`.}
  FLAG_START_TRACKING*: jint {.`static`.}
  FLAG_TAINTED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[KeyEvent] {.`static`.}

jclass android.view.KeyEvent.DispatcherState* of JVMObject:
  proc reset*()
  proc reset*(target: JObject)
  proc startTracking*(event: KeyEvent, target: JObject)
  proc isTracking*(event: KeyEvent): jboolean
  proc performedLongPress*(event: KeyEvent)
  proc handleUpEvent*(event: KeyEvent)


jclass android.view.DispatcherState* of JVMObject:
  proc reset*()
  proc reset*(target: JObject)
  proc startTracking*(event: KeyEvent, target: JObject)
  proc isTracking*(event: KeyEvent): jboolean
  proc performedLongPress*(event: KeyEvent)
  proc handleUpEvent*(event: KeyEvent)

