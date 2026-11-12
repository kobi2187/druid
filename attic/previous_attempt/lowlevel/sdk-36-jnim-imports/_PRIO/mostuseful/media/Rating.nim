import jnim

jclass android.media.Rating* of JVMObject:
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc newUnratedRating*(ratingStyle: jint): Rating {.`static`.}
  proc newHeartRating*(hasHeart: jboolean): Rating {.`static`.}
  proc newThumbRating*(thumbIsUp: jboolean): Rating {.`static`.}
  proc newStarRating*(starRatingStyle: jint, starRating: jfloat): Rating {.`static`.}
  proc newPercentageRating*(percent: jfloat): Rating {.`static`.}
  proc isRated*(): jboolean
  proc getRatingStyle*(): jint
  proc hasHeart*(): jboolean
  proc isThumbUp*(): jboolean
  proc getStarRating*(): jfloat
  proc getPercentRating*(): jfloat
  RATING_NONE*: jint {.`static`.}
  RATING_HEART*: jint {.`static`.}
  RATING_THUMB_UP_DOWN*: jint {.`static`.}
  RATING_3_STARS*: jint {.`static`.}
  RATING_4_STARS*: jint {.`static`.}
  RATING_5_STARS*: jint {.`static`.}
  RATING_PERCENTAGE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Rating] {.`static`.}

