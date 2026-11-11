import jnim

jclass android.util.Rational* of Number:
  proc getNumerator*(): jint
  proc getDenominator*(): jint
  proc isNaN*(): jboolean
  proc isInfinite*(): jboolean
  proc isFinite*(): jboolean
  proc isZero*(): jboolean
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc toFloat*(): jfloat
  proc hashCode*(): jint
  proc gcd*(numerator: jint, denominator: jint): jint {.`static`.}
  proc doubleValue*(): jdouble
  proc floatValue*(): jfloat
  proc intValue*(): jint
  proc longValue*(): jlong
  proc shortValue*(): jshort
  proc compareTo*(another: Rational): jint
  proc parseRational*(string: string): Rational {.`static`.}
  NaN*: Rational {.`static`.}
  POSITIVE_INFINITY*: Rational {.`static`.}
  NEGATIVE_INFINITY*: Rational {.`static`.}
  ZERO*: Rational {.`static`.}

