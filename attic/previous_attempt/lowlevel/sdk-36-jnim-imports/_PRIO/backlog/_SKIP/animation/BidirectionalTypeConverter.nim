import jnim

jclass android.animation.BidirectionalTypeConverter* of TypeConverter:
  proc convertBack*(value: V): T
  proc invert*(): BidirectionalTypeConverter[V, T]

