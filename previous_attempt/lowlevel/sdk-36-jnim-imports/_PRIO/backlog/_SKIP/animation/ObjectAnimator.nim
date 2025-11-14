import jnim

jclass android.animation.ObjectAnimator* of ValueAnimator:
  proc setPropertyName*(propertyName: string)
  proc setProperty*(property: Property)
  proc getPropertyName*(): string
  proc ofInt*(target: JObject, propertyName: string, values: jint): ObjectAnimator {.`static`.}
  proc ofInt*(target: JObject, xPropertyName: string, yPropertyName: string, path: Path): ObjectAnimator {.`static`.}
  proc ofInt*(target: T, property: Property[T, Integer], values: jint): ObjectAnimator {.`static`.}
  proc ofInt*(target: T, xProperty: Property[T, Integer], yProperty: Property[T, Integer], path: Path): ObjectAnimator {.`static`.}
  proc ofMultiInt*(target: JObject, propertyName: string, values: seq[seq[jint]]): ObjectAnimator {.`static`.}
  proc ofMultiInt*(target: JObject, propertyName: string, path: Path): ObjectAnimator {.`static`.}
  proc ofMultiInt*(target: JObject, propertyName: string, converter: TypeConverter[T, seq[jint]], evaluator: TypeEvaluator[T], values: T): ObjectAnimator {.`static`.}
  proc ofArgb*(target: JObject, propertyName: string, values: jint): ObjectAnimator {.`static`.}
  proc ofArgb*(target: T, property: Property[T, Integer], values: jint): ObjectAnimator {.`static`.}
  proc ofFloat*(target: JObject, propertyName: string, values: jfloat): ObjectAnimator {.`static`.}
  proc ofFloat*(target: JObject, xPropertyName: string, yPropertyName: string, path: Path): ObjectAnimator {.`static`.}
  proc ofFloat*(target: T, property: Property[T, Float], values: jfloat): ObjectAnimator {.`static`.}
  proc ofFloat*(target: T, xProperty: Property[T, Float], yProperty: Property[T, Float], path: Path): ObjectAnimator {.`static`.}
  proc ofMultiFloat*(target: JObject, propertyName: string, values: seq[seq[jfloat]]): ObjectAnimator {.`static`.}
  proc ofMultiFloat*(target: JObject, propertyName: string, path: Path): ObjectAnimator {.`static`.}
  proc ofMultiFloat*(target: JObject, propertyName: string, converter: TypeConverter[T, seq[jfloat]], evaluator: TypeEvaluator[T], values: T): ObjectAnimator {.`static`.}
  proc ofObject*(target: JObject, propertyName: string, evaluator: TypeEvaluator, values: JObject): ObjectAnimator {.`static`.}
  proc ofObject*(target: JObject, propertyName: string, converter: TypeConverter[PointF, ?], path: Path): ObjectAnimator {.`static`.}
  proc ofObject*(target: T, property: Property[T, V], evaluator: TypeEvaluator[V], values: V): ObjectAnimator {.`static`.}
  proc ofObject*(target: T, property: Property[T, P], converter: TypeConverter[V, P], evaluator: TypeEvaluator[V], values: V): ObjectAnimator {.`static`.}
  proc ofObject*(target: T, property: Property[T, V], converter: TypeConverter[PointF, V], path: Path): ObjectAnimator {.`static`.}
  proc ofPropertyValuesHolder*(target: JObject, values: PropertyValuesHolder): ObjectAnimator {.`static`.}
  proc setIntValues*(values: jint)
  proc setFloatValues*(values: jfloat)
  proc setObjectValues*(values: JObject)
  proc setAutoCancel*(cancel: jboolean)
  proc start*()
  proc setDuration*(duration: jlong): ObjectAnimator
  proc getTarget*(): JObject
  proc setTarget*(target: JObject)
  proc setupStartValues*()
  proc setupEndValues*()
  proc clone*(): ObjectAnimator
  proc toString*(): string

