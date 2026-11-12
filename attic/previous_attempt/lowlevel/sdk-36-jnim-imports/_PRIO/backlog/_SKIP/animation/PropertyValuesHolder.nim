import jnim

jclass android.animation.PropertyValuesHolder* of JVMObject:
  proc ofInt*(propertyName: string, values: jint): PropertyValuesHolder {.`static`.}
  proc ofInt*(property: Property[?, Integer], values: jint): PropertyValuesHolder {.`static`.}
  proc ofMultiInt*(propertyName: string, values: seq[seq[jint]]): PropertyValuesHolder {.`static`.}
  proc ofMultiInt*(propertyName: string, path: Path): PropertyValuesHolder {.`static`.}
  proc ofMultiInt*(propertyName: string, converter: TypeConverter[V, seq[jint]], evaluator: TypeEvaluator[V], values: V): PropertyValuesHolder {.`static`.}
  proc ofMultiInt*(propertyName: string, converter: TypeConverter[T, seq[jint]], evaluator: TypeEvaluator[T], values: Keyframe): PropertyValuesHolder {.`static`.}
  proc ofFloat*(propertyName: string, values: jfloat): PropertyValuesHolder {.`static`.}
  proc ofFloat*(property: Property[?, Float], values: jfloat): PropertyValuesHolder {.`static`.}
  proc ofMultiFloat*(propertyName: string, values: seq[seq[jfloat]]): PropertyValuesHolder {.`static`.}
  proc ofMultiFloat*(propertyName: string, path: Path): PropertyValuesHolder {.`static`.}
  proc ofMultiFloat*(propertyName: string, converter: TypeConverter[V, seq[jfloat]], evaluator: TypeEvaluator[V], values: V): PropertyValuesHolder {.`static`.}
  proc ofMultiFloat*(propertyName: string, converter: TypeConverter[T, seq[jfloat]], evaluator: TypeEvaluator[T], values: Keyframe): PropertyValuesHolder {.`static`.}
  proc ofObject*(propertyName: string, evaluator: TypeEvaluator, values: JObject): PropertyValuesHolder {.`static`.}
  proc ofObject*(propertyName: string, converter: TypeConverter[PointF, ?], path: Path): PropertyValuesHolder {.`static`.}
  proc ofObject*(property: Property, evaluator: TypeEvaluator[V], values: V): PropertyValuesHolder {.`static`.}
  proc ofObject*(property: Property[?, V], converter: TypeConverter[T, V], evaluator: TypeEvaluator[T], values: T): PropertyValuesHolder {.`static`.}
  proc ofObject*(property: Property[?, V], converter: TypeConverter[PointF, V], path: Path): PropertyValuesHolder {.`static`.}
  proc ofKeyframe*(propertyName: string, values: Keyframe): PropertyValuesHolder {.`static`.}
  proc ofKeyframe*(property: Property, values: Keyframe): PropertyValuesHolder {.`static`.}
  proc setIntValues*(values: jint)
  proc setFloatValues*(values: jfloat)
  proc setKeyframes*(values: Keyframe)
  proc setObjectValues*(values: JObject)
  proc setConverter*(converter: TypeConverter)
  proc clone*(): PropertyValuesHolder
  proc setEvaluator*(evaluator: TypeEvaluator)
  proc setPropertyName*(propertyName: string)
  proc setProperty*(property: Property)
  proc getPropertyName*(): string
  proc getPropertyValues*(values: PropertyValues)
  proc getValueType*(): Class
  proc toString*(): string

jclass android.animation.PropertyValuesHolder.PropertyValues* of JVMObject:
  proc toString*(): string

jclass android.animation.PropertyValues* of JVMObject:
  proc toString*(): string
  propertyName*: string
  typ*: Class
  startValue*: JObject
  endValue*: JObject
  dataSource*: DataSource

