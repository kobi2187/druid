import jnim

jclass java.util.SplittableRandom* of JVMObject:
  proc split*(): SplittableRandom
  proc split*(source: SplittableGenerator): SplittableRandom
  proc nextInt*(): jint
  proc nextLong*(): jlong
  proc nextBytes*(bytes: seq[jbyte])
  proc splits*(): Stream[SplittableGenerator]
  proc splits*(streamSize: jlong): Stream[SplittableGenerator]
  proc splits*(source: SplittableGenerator): Stream[SplittableGenerator]
  proc splits*(streamSize: jlong, source: SplittableGenerator): Stream[SplittableGenerator]
  proc ints*(streamSize: jlong): IntStream
  proc ints*(): IntStream
  proc ints*(streamSize: jlong, randomNumberOrigin: jint, randomNumberBound: jint): IntStream
  proc ints*(randomNumberOrigin: jint, randomNumberBound: jint): IntStream
  proc longs*(streamSize: jlong): LongStream
  proc longs*(): LongStream
  proc longs*(streamSize: jlong, randomNumberOrigin: jlong, randomNumberBound: jlong): LongStream
  proc longs*(randomNumberOrigin: jlong, randomNumberBound: jlong): LongStream
  proc doubles*(streamSize: jlong): DoubleStream
  proc doubles*(): DoubleStream
  proc doubles*(streamSize: jlong, randomNumberOrigin: jdouble, randomNumberBound: jdouble): DoubleStream
  proc doubles*(randomNumberOrigin: jdouble, randomNumberBound: jdouble): DoubleStream

