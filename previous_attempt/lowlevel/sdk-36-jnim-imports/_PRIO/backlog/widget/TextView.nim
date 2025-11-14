import jnim

jclass android.widget.TextView* of View:
  proc preloadFontCache*() {.`static`.}
  proc setAutoSizeTextTypeWithDefaults*(autoSizeTextType: jint)
  proc setAutoSizeTextTypeUniformWithConfiguration*(autoSizeMinTextSize: jint, autoSizeMaxTextSize: jint, autoSizeStepGranularity: jint, unit: jint)
  proc setAutoSizeTextTypeUniformWithPresetSizes*(presetSizes: seq[jint], unit: jint)
  proc getAutoSizeTextType*(): jint
  proc getAutoSizeStepGranularity*(): jint
  proc getAutoSizeMinTextSize*(): jint
  proc getAutoSizeMaxTextSize*(): jint
  proc getAutoSizeTextAvailableSizes*(): seq[jint]
  proc onActivityResult*(requestCode: jint, resultCode: jint, data: Intent)
  proc setEnabled*(enabled: jboolean)
  proc setTypeface*(tf: Typeface, style: jint)
  proc getText*(): CharSequence
  proc length*(): jint
  proc getEditableText*(): Editable
  proc getTransformed*(): CharSequence
  proc getLineHeight*(): jint
  proc getLayout*(): Layout
  proc getUndoManager*(): UndoManager
  proc getEditorForTesting*(): Editor
  proc setUndoManager*(undoManager: UndoManager, tag: string)
  proc getKeyListener*(): KeyListener
  proc setKeyListener*(input: KeyListener)
  proc getMovementMethod*(): MovementMethod
  proc setMovementMethod*(movement: MovementMethod)
  proc getTransformationMethod*(): TransformationMethod
  proc setTransformationMethod*(method: TransformationMethod)
  proc getCompoundPaddingTop*(): jint
  proc getCompoundPaddingBottom*(): jint
  proc getCompoundPaddingLeft*(): jint
  proc getCompoundPaddingRight*(): jint
  proc getCompoundPaddingStart*(): jint
  proc getCompoundPaddingEnd*(): jint
  proc getExtendedPaddingTop*(): jint
  proc getExtendedPaddingBottom*(): jint
  proc getTotalPaddingLeft*(): jint
  proc getTotalPaddingRight*(): jint
  proc getTotalPaddingStart*(): jint
  proc getTotalPaddingEnd*(): jint
  proc getTotalPaddingTop*(): jint
  proc getTotalPaddingBottom*(): jint
  proc setCompoundDrawables*(left: Drawable, top: Drawable, right: Drawable, bottom: Drawable)
  proc setCompoundDrawablesWithIntrinsicBounds*(left: jint, top: jint, right: jint, bottom: jint)
  proc setCompoundDrawablesWithIntrinsicBounds*(left: Drawable, top: Drawable, right: Drawable, bottom: Drawable)
  proc setCompoundDrawablesRelative*(start: Drawable, top: Drawable, end: Drawable, bottom: Drawable)
  proc setCompoundDrawablesRelativeWithIntrinsicBounds*(start: jint, top: jint, end: jint, bottom: jint)
  proc setCompoundDrawablesRelativeWithIntrinsicBounds*(start: Drawable, top: Drawable, end: Drawable, bottom: Drawable)
  proc getCompoundDrawables*(): seq[Drawable]
  proc getCompoundDrawablesRelative*(): seq[Drawable]
  proc setCompoundDrawablePadding*(pad: jint)
  proc getCompoundDrawablePadding*(): jint
  proc setCompoundDrawableTintList*(tint: ColorStateList)
  proc getCompoundDrawableTintList*(): ColorStateList
  proc setCompoundDrawableTintMode*(tintMode: PorterDuff.Mode)
  proc setCompoundDrawableTintBlendMode*(blendMode: BlendMode)
  proc getCompoundDrawableTintMode*(): PorterDuff.Mode
  proc getCompoundDrawableTintBlendMode*(): BlendMode
  proc setPadding*(left: jint, top: jint, right: jint, bottom: jint)
  proc setPaddingRelative*(start: jint, top: jint, end: jint, bottom: jint)
  proc setFirstBaselineToTopHeight*(firstBaselineToTopHeight: jint)
  proc setLastBaselineToBottomHeight*(lastBaselineToBottomHeight: jint)
  proc getFirstBaselineToTopHeight*(): jint
  proc getLastBaselineToBottomHeight*(): jint
  proc getAutoLinkMask*(): jint
  proc setTextSelectHandle*(textSelectHandle: Drawable)
  proc setTextSelectHandle*(textSelectHandle: jint)
  proc getTextSelectHandle*(): Drawable
  proc setTextSelectHandleLeft*(textSelectHandleLeft: Drawable)
  proc setTextSelectHandleLeft*(textSelectHandleLeft: jint)
  proc getTextSelectHandleLeft*(): Drawable
  proc setTextSelectHandleRight*(textSelectHandleRight: Drawable)
  proc setTextSelectHandleRight*(textSelectHandleRight: jint)
  proc getTextSelectHandleRight*(): Drawable
  proc setTextCursorDrawable*(textCursorDrawable: Drawable)
  proc setTextCursorDrawable*(textCursorDrawable: jint)
  proc getTextCursorDrawable*(): Drawable
  proc setTextAppearance*(resId: jint)
  proc setTextAppearance*(context: Context, resId: jint)
  proc getTextLocale*(): Locale
  proc getTextLocales*(): LocaleList
  proc setTextLocale*(locale: Locale)
  proc setTextLocales*(locales: LocaleList)
  proc getTextSize*(): jfloat
  proc getScaledTextSize*(): jfloat
  proc getTypefaceStyle*(): jint
  proc setTextSize*(size: jfloat)
  proc setTextSize*(unit: jint, size: jfloat)
  proc getTextSizeUnit*(): jint
  proc getTextScaleX*(): jfloat
  proc setTextScaleX*(size: jfloat)
  proc setTypeface*(tf: Typeface)
  proc getTypeface*(): Typeface
  proc setElegantTextHeight*(elegant: jboolean)
  proc setFallbackLineSpacing*(enabled: jboolean)
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean)
  proc getUseBoundsForWidth*(): jboolean
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean)
  proc getShiftDrawingOffsetForStartOverhang*(): jboolean
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics)
  proc getMinimumFontMetrics*(): Paint.FontMetrics
  proc isLocalePreferredLineHeightForMinimumUsed*(): jboolean
  proc setLocalePreferredLineHeightForMinimumUsed*(flag: jboolean)
  proc isFallbackLineSpacing*(): jboolean
  proc isElegantTextHeight*(): jboolean
  proc getLetterSpacing*(): jfloat
  proc setLetterSpacing*(letterSpacing: jfloat)
  proc getFontFeatureSettings*(): string
  proc getFontVariationSettings*(): string
  proc setBreakStrategy*(breakStrategy: jint)
  proc getBreakStrategy*(): jint
  proc setHyphenationFrequency*(hyphenationFrequency: jint)
  proc getHyphenationFrequency*(): jint
  proc setLineBreakStyle*(lineBreakStyle: jint)
  proc setLineBreakWordStyle*(lineBreakWordStyle: jint)
  proc getLineBreakStyle*(): jint
  proc getLineBreakWordStyle*(): jint
  proc getTextMetricsParams*(): PrecomputedText.Params
  proc setTextMetricsParams*(params: PrecomputedText.Params)
  proc setJustificationMode*(justificationMode: jint)
  proc getJustificationMode*(): jint
  proc setFontFeatureSettings*(fontFeatureSettings: string)
  proc setFontVariationSettings*(fontVariationSettings: string): jboolean
  proc setTextColor*(color: jint)
  proc setTextColor*(colors: ColorStateList)
  proc getTextColors*(): ColorStateList
  proc getCurrentTextColor*(): jint
  proc setHighlightColor*(color: jint)
  proc getHighlightColor*(): jint
  proc setShowSoftInputOnFocus*(show: jboolean)
  proc getShowSoftInputOnFocus*(): jboolean
  proc setShadowLayer*(radius: jfloat, dx: jfloat, dy: jfloat, color: jint)
  proc getShadowRadius*(): jfloat
  proc getShadowDx*(): jfloat
  proc getShadowDy*(): jfloat
  proc getShadowColor*(): jint
  proc getPaint*(): TextPaint
  proc setAutoLinkMask*(mask: jint)
  proc setLinksClickable*(whether: jboolean)
  proc getLinksClickable*(): jboolean
  proc getUrls*(): seq[URLSpan]
  proc setHintTextColor*(color: jint)
  proc setHintTextColor*(colors: ColorStateList)
  proc getHintTextColors*(): ColorStateList
  proc getCurrentHintTextColor*(): jint
  proc setLinkTextColor*(color: jint)
  proc setLinkTextColor*(colors: ColorStateList)
  proc getLinkTextColors*(): ColorStateList
  proc setGravity*(gravity: jint)
  proc getGravity*(): jint
  proc getPaintFlags*(): jint
  proc setPaintFlags*(flags: jint)
  proc setHorizontallyScrolling*(whether: jboolean)
  proc isHorizontallyScrollable*(): jboolean
  proc getHorizontallyScrolling*(): jboolean
  proc setMinLines*(minLines: jint)
  proc getMinLines*(): jint
  proc setMinHeight*(minPixels: jint)
  proc getMinHeight*(): jint
  proc setMaxLines*(maxLines: jint)
  proc getMaxLines*(): jint
  proc setMaxHeight*(maxPixels: jint)
  proc getMaxHeight*(): jint
  proc setLines*(lines: jint)
  proc setHeight*(pixels: jint)
  proc setMinEms*(minEms: jint)
  proc getMinEms*(): jint
  proc setMinWidth*(minPixels: jint)
  proc getMinWidth*(): jint
  proc setMaxEms*(maxEms: jint)
  proc getMaxEms*(): jint
  proc setMaxWidth*(maxPixels: jint)
  proc getMaxWidth*(): jint
  proc setEms*(ems: jint)
  proc setWidth*(pixels: jint)
  proc setLineSpacing*(add: jfloat, mult: jfloat)
  proc getLineSpacingMultiplier*(): jfloat
  proc getLineSpacingExtra*(): jfloat
  proc setLineHeight*(lineHeight: jint)
  proc setLineHeight*(unit: jint, lineHeight: jfloat)
  proc setHighlights*(highlights: Highlights)
  proc getHighlights*(): Highlights
  proc setSearchResultHighlights*(ranges: jint)
  proc getSearchResultHighlights*(): seq[jint]
  proc setFocusedSearchResultIndex*(index: jint)
  proc getFocusedSearchResultIndex*(): jint
  proc setSearchResultHighlightColor*(color: jint)
  proc getSearchResultHighlightColor*(): jint
  proc setFocusedSearchResultHighlightColor*(color: jint)
  proc getFocusedSearchResultHighlightColor*(): jint
  proc append*(text: CharSequence)
  proc append*(text: CharSequence, start: jint, end: jint)
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc setFreezesText*(freezesText: jboolean)
  proc getFreezesText*(): jboolean
  proc setEditableFactory*(factory: Editable.Factory)
  proc setSpannableFactory*(factory: Spannable.Factory)
  proc setText*(text: CharSequence)
  proc setTextAsync*(text: CharSequence): Runnable
  proc setTextKeepState*(text: CharSequence)
  proc setText*(text: CharSequence, type: BufferType)
  proc setText*(text: seq[jchar], start: jint, len: jint)
  proc setTextKeepState*(text: CharSequence, type: BufferType)
  proc setText*(resid: jint)
  proc setText*(resid: jint, type: BufferType)
  proc setHint*(hint: CharSequence)
  proc setHint*(resid: jint)
  proc getHint*(): CharSequence
  proc hideHint*()
  proc isSingleLine*(): jboolean
  proc setInputType*(type: jint)
  proc isAnyPasswordInputType*(): jboolean
  proc setRawInputType*(type: jint)
  proc getAutofillHints*(): seq[string]
  proc getInputType*(): jint
  proc setImeOptions*(imeOptions: jint)
  proc getImeOptions*(): jint
  proc setImeActionLabel*(label: CharSequence, actionId: jint)
  proc getImeActionLabel*(): CharSequence
  proc getImeActionId*(): jint
  proc setOnEditorActionListener*(l: OnEditorActionListener)
  proc onEditorAction*(actionCode: jint)
  proc setPrivateImeOptions*(type: string)
  proc getPrivateImeOptions*(): string
  proc setInputExtras*(xmlResId: jint)
  proc getInputExtras*(create: jboolean): Bundle
  proc setImeHintLocales*(hintLocales: LocaleList)
  proc getImeHintLocales*(): LocaleList
  proc getError*(): CharSequence
  proc setError*(error: CharSequence)
  proc setError*(error: CharSequence, icon: Drawable)
  proc setFilters*(filters: seq[InputFilter])
  proc getFilters*(): seq[InputFilter]
  proc onPreDraw*(): jboolean
  proc onScreenStateChanged*(screenState: jint)
  proc jumpDrawablesToCurrentState*()
  proc invalidateDrawable*(drawable: Drawable)
  proc hasOverlappingRendering*(): jboolean
  proc isTextSelectable*(): jboolean
  proc setTextIsSelectable*(selectable: jboolean)
  proc getHorizontalOffsetForDrawables*(): jint
  proc getFocusedRect*(r: Rect)
  proc getLineCount*(): jint
  proc getLineBounds*(line: jint, bounds: Rect): jint
  proc getBaseline*(): jint
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon
  proc onKeyPreIme*(keyCode: jint, event: KeyEvent): jboolean
  proc handleBackInTextActionModeIfNeeded*(event: KeyEvent): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyMultiple*(keyCode: jint, repeatCount: jint, event: KeyEvent): jboolean
  proc resetErrorChangedFlag*()
  proc hideErrorIfUnchanged*()
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc onCheckIsTextEditor*(): jboolean
  proc onCreateInputConnection*(outAttrs: EditorInfo): InputConnection
  proc onRequestCursorUpdatesInternal*(cursorUpdateMode: jint, cursorUpdateFilter: jint)
  proc extractText*(request: ExtractedTextRequest, outText: ExtractedText): jboolean
  proc setExtractedText*(text: ExtractedText)
  proc setExtracting*(req: ExtractedTextRequest)
  proc onCommitCompletion*(text: CompletionInfo)
  proc onCommitCorrection*(info: CorrectionInfo)
  proc beginBatchEdit*()
  proc endBatchEdit*()
  proc onBeginBatchEdit*()
  proc onEndBatchEdit*()
  proc onPerformSpellCheck*()
  proc onPrivateIMECommand*(action: string, data: Bundle): jboolean
  proc isOffsetMappingAvailable*(): jboolean
  proc previewHandwritingGesture*(gesture: PreviewableHandwritingGesture, cancellationSignal: CancellationSignal): jboolean
  proc performHandwritingSelectGesture*(gesture: SelectGesture): jint
  proc performHandwritingSelectRangeGesture*(gesture: SelectRangeGesture): jint
  proc performHandwritingDeleteGesture*(gesture: DeleteGesture): jint
  proc performHandwritingDeleteRangeGesture*(gesture: DeleteRangeGesture): jint
  proc performHandwritingInsertGesture*(gesture: InsertGesture): jint
  proc performHandwritingRemoveSpaceGesture*(gesture: RemoveSpaceGesture): jint
  proc performHandwritingJoinOrSplitGesture*(gesture: JoinOrSplitGesture): jint
  proc performHandwritingInsertModeGesture*(gesture: InsertModeGesture): jint
  proc nullLayouts*()
  proc makeNewLayout*(wantWidth: jint, hintWidth: jint, boring: BoringLayout.Metrics, hintBoring: BoringLayout.Metrics, ellipsisWidth: jint, bringIntoView: jboolean)
  proc useDynamicLayout*(): jboolean
  proc setIncludeFontPadding*(includepad: jboolean)
  proc getIncludeFontPadding*(): jboolean
  proc bringPointIntoView*(offset: jint): jboolean
  proc bringPointIntoView*(offset: jint, requestRectWithoutFocus: jboolean): jboolean
  proc moveCursorToVisibleOffset*(): jboolean
  proc computeScroll*()
  proc debug*(depth: jint)
  proc getSelectionStart*(): jint
  proc getSelectionEnd*(): jint
  proc getSelection*(start: jint, end: jint, consumer: Layout.SelectionRectangleConsumer)
  proc hasSelection*(): jboolean
  proc getSelectedText*(): string
  proc setSingleLine*()
  proc setAllCaps*(allCaps: jboolean)
  proc isAllCaps*(): jboolean
  proc setSingleLine*(singleLine: jboolean)
  proc setEllipsize*(where: TextUtils.TruncateAt)
  proc setMarqueeRepeatLimit*(marqueeLimit: jint)
  proc getMarqueeRepeatLimit*(): jint
  proc getEllipsize*(): TextUtils.TruncateAt
  proc setSelectAllOnFocus*(selectAllOnFocus: jboolean)
  proc setCursorVisible*(visible: jboolean)
  proc setImeConsumesInput*(imeConsumesInput: jboolean)
  proc isCursorVisible*(): jboolean
  proc isCursorVisibleFromAttr*(): jboolean
  proc addTextChangedListener*(watcher: TextWatcher)
  proc removeTextChangedListener*(watcher: TextWatcher)
  proc notifyContentCaptureTextChanged*()
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc onVisibilityAggregated*(isVisible: jboolean)
  proc clearComposingText*()
  proc setSelected*(selected: jboolean)
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc showUIForTouchScreen*(): jboolean
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc showContextMenu*(): jboolean
  proc showContextMenu*(x: jfloat, y: jfloat): jboolean
  proc didTouchFocusSelect*(): jboolean
  proc cancelLongPress*()
  proc onTrackballEvent*(event: MotionEvent): jboolean
  proc setScroller*(s: Scroller)
  proc findViewsWithText*(outViews: ArrayList[View], searched: CharSequence, flags: jint)
  proc getTextColors*(context: Context, attrs: TypedArray): ColorStateList {.`static`.}
  proc getTextColor*(context: Context, attrs: TypedArray, def: jint): jint {.`static`.}
  proc onKeyShortcut*(keyCode: jint, event: KeyEvent): jboolean
  proc setTextOperationUser*(user: UserHandle)
  proc isAutoHandwritingEnabled*(): jboolean
  proc shouldTrackHandwritingArea*(): jboolean
  proc isStylusHandwritingAvailable*(): jboolean
  proc getTextServicesLocale*(): Locale
  proc isInExtractedMode*(): jboolean
  proc getSpellCheckerLocale*(): Locale
  proc getWordIterator*(): WordIterator
  proc onPopulateAccessibilityEventInternal*(event: AccessibilityEvent)
  proc getAccessibilityClassName*(): CharSequence
  proc canRequestAutofill*(): jboolean
  proc autofill*(value: AutofillValue)
  proc getAutofillType*(): jint
  proc getAutofillValue*(): AutofillValue
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc addExtraDataToAccessibilityNodeInfo*(info: AccessibilityNodeInfo, extraDataKey: string, arguments: Bundle)
  proc populateCharacterBounds*(builder: CursorAnchorInfo.Builder, startIndex: jint, endIndex: jint, viewportToContentHorizontalOffset: jfloat, viewportToContentVerticalOffset: jfloat)
  proc getCursorAnchorInfo*(filter: jint, cursorAnchorInfoBuilder: CursorAnchorInfo.Builder, viewToScreenMatrix: Matrix): CursorAnchorInfo
  proc getTextBoundsInfo*(bounds: RectF): TextBoundsInfo
  proc isPositionVisible*(positionX: jfloat, positionY: jfloat): jboolean
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean
  proc sendAccessibilityEventInternal*(eventType: jint)
  proc sendAccessibilityEventUnchecked*(event: AccessibilityEvent)
  proc isInputMethodTarget*(): jboolean
  proc onTextContextMenuItem*(id: jint): jboolean
  proc performLongClick*(): jboolean
  proc isSuggestionsEnabled*(): jboolean
  proc setCustomSelectionActionModeCallback*(actionModeCallback: ActionMode.Callback)
  proc getCustomSelectionActionModeCallback*(): ActionMode.Callback
  proc setCustomInsertionActionModeCallback*(actionModeCallback: ActionMode.Callback)
  proc getCustomInsertionActionModeCallback*(): ActionMode.Callback
  proc setTextClassifier*(textClassifier: TextClassifier)
  proc getTextClassifier*(): TextClassifier
  proc requestActionMode*(clickedSpan: TextLinks.TextLinkSpan): jboolean
  proc handleClick*(clickedSpan: TextLinks.TextLinkSpan): jboolean
  proc hideFloatingToolbar*(durationMs: jint)
  proc canUndo*(): jboolean
  proc canRedo*(): jboolean
  proc canCut*(): jboolean
  proc canCopy*(): jboolean
  proc canShare*(): jboolean
  proc canPaste*(): jboolean
  proc canPasteAsPlainText*(): jboolean
  proc canSelectAllText*(): jboolean
  proc getOffsetForPosition*(x: jfloat, y: jfloat): jint
  proc getLineAtCoordinate*(y: jfloat): jint
  proc transformedToOriginal*(offset: jint, strategy: jint): jint
  proc originalToTransformed*(offset: jint, strategy: jint): jint
  proc onDragEvent*(event: DragEvent): jboolean
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc getTextDirectionHeuristic*(): TextDirectionHeuristic
  proc onResolveDrawables*(layoutDirection: jint)
  proc getIterableTextForAccessibility*(): CharSequence
  proc getIteratorForGranularity*(granularity: jint): TextSegmentIterator
  proc getAccessibilitySelectionStart*(): jint
  proc isAccessibilitySelectionExtendable*(): jboolean
  proc prepareForExtendedAccessibilitySelection*()
  proc getAccessibilitySelectionEnd*(): jint
  proc setAccessibilitySelection*(start: jint, end: jint)
  proc onInputConnectionOpenedInternal*(ic: InputConnection, editorInfo: EditorInfo, handler: Handler)
  proc onInputConnectionClosedInternal*()
  proc onReceiveContent*(payload: ContentInfo): ContentInfo
  proc onCreateViewTranslationRequest*(supportedFormats: seq[jint], requestsCollector: Consumer[ViewTranslationRequest])
  PROCESS_TEXT_REQUEST_CODE*: jint {.`static`.}
  BORINGLAYOUT_FALLBACK_LINESPACING*: jlong {.`static`.}
  STATICLAYOUT_FALLBACK_LINESPACING*: jlong {.`static`.}
  USE_BOUNDS_FOR_WIDTH*: jlong {.`static`.}
  AUTO_SIZE_TEXT_TYPE_NONE*: jint {.`static`.}
  AUTO_SIZE_TEXT_TYPE_UNIFORM*: jint {.`static`.}
  FOCUSED_SEARCH_RESULT_INDEX_NONE*: jint {.`static`.}
  UNKNOWN_BORING*: BoringLayout.Metrics {.`static`.}

jclass android.widget.TextView.SavedState* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string


jclass android.widget.SavedState* of BaseSavedState:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[SavedState] {.`static`.}

