import jnim

jclass android.window.RemoteTransitionStub* of Stub:
  proc mergeAnimation*(transition: IBinder, info: TransitionInfo, t: SurfaceControl.Transaction, mergeTarget: IBinder, finishCallback: IRemoteTransitionFinishedCallback)
  proc takeOverAnimation*(transition: IBinder, info: TransitionInfo, startTransaction: SurfaceControl.Transaction, finishCallback: IRemoteTransitionFinishedCallback, states: seq[WindowAnimationState])
  proc onTransitionConsumed*(transition: IBinder, aborted: jboolean)

