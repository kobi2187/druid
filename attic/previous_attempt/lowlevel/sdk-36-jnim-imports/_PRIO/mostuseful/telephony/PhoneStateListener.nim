import jnim

jclass android.telephony.PhoneStateListener* of JVMObject:
  proc onServiceStateChanged*(serviceState: ServiceState)
  proc onSignalStrengthChanged*(asu: jint)
  proc onMessageWaitingIndicatorChanged*(mwi: jboolean)
  proc onCallForwardingIndicatorChanged*(cfi: jboolean)
  proc onCellLocationChanged*(location: CellLocation)
  proc onCallStateChanged*(state: jint, phoneNumber: string)
  proc onDataConnectionStateChanged*(state: jint)
  proc onDataConnectionStateChanged*(state: jint, networkType: jint)
  proc onDataActivity*(direction: jint)
  proc onSignalStrengthsChanged*(signalStrength: SignalStrength)
  proc onCellInfoChanged*(cellInfo: List[CellInfo])
  proc onPreciseCallStateChanged*(callState: PreciseCallState)
  proc onCallDisconnectCauseChanged*(disconnectCause: jint, preciseDisconnectCause: jint)
  proc onImsCallDisconnectCauseChanged*(imsReasonInfo: ImsReasonInfo)
  proc onPreciseDataConnectionStateChanged*(dataConnectionState: PreciseDataConnectionState)
  proc onDataConnectionRealTimeInfoChanged*(dcRtInfo: DataConnectionRealTimeInfo)
  proc onSrvccStateChanged*(srvccState: jint)
  proc onVoiceActivationStateChanged*(state: jint)
  proc onDataActivationStateChanged*(state: jint)
  proc onUserMobileDataStateChanged*(enabled: jboolean)
  proc onDisplayInfoChanged*(telephonyDisplayInfo: TelephonyDisplayInfo)
  proc onEmergencyNumberListChanged*(emergencyNumberList: Map[Integer, List[EmergencyNumber]])
  proc onOutgoingEmergencyCall*(placedEmergencyNumber: EmergencyNumber)
  proc onOutgoingEmergencyCall*(placedEmergencyNumber: EmergencyNumber, subscriptionId: jint)
  proc onOutgoingEmergencySms*(sentEmergencyNumber: EmergencyNumber)
  proc onOutgoingEmergencySms*(sentEmergencyNumber: EmergencyNumber, subscriptionId: jint)
  proc onOemHookRawEvent*(rawData: seq[jbyte])
  proc onPhoneCapabilityChanged*(capability: PhoneCapability)
  proc onActiveDataSubscriptionIdChanged*(subId: jint)
  proc onCallAttributesChanged*(callAttributes: CallAttributes)
  proc onRadioPowerStateChanged*(state: jint)
  proc onCarrierNetworkChange*(active: jboolean)
  proc onRegistrationFailed*(cellIdentity: CellIdentity, chosenPlmn: string, domain: jint, causeCode: jint, additionalCauseCode: jint)
  proc onBarringInfoChanged*(barringInfo: BarringInfo)
  LISTEN_NONE*: jint {.`static`.}
  LISTEN_SERVICE_STATE*: jint {.`static`.}
  LISTEN_SIGNAL_STRENGTH*: jint {.`static`.}
  LISTEN_MESSAGE_WAITING_INDICATOR*: jint {.`static`.}
  LISTEN_CALL_FORWARDING_INDICATOR*: jint {.`static`.}
  LISTEN_CELL_LOCATION*: jint {.`static`.}
  LISTEN_CALL_STATE*: jint {.`static`.}
  LISTEN_DATA_CONNECTION_STATE*: jint {.`static`.}
  LISTEN_DATA_ACTIVITY*: jint {.`static`.}
  LISTEN_SIGNAL_STRENGTHS*: jint {.`static`.}
  LISTEN_CELL_INFO*: jint {.`static`.}
  LISTEN_PRECISE_CALL_STATE*: jint {.`static`.}
  LISTEN_PRECISE_DATA_CONNECTION_STATE*: jint {.`static`.}
  LISTEN_DATA_CONNECTION_REAL_TIME_INFO*: jint {.`static`.}
  LISTEN_SRVCC_STATE_CHANGED*: jint {.`static`.}
  LISTEN_OEM_HOOK_RAW_EVENT*: jint {.`static`.}
  LISTEN_CARRIER_NETWORK_CHANGE*: jint {.`static`.}
  LISTEN_VOICE_ACTIVATION_STATE*: jint {.`static`.}
  LISTEN_DATA_ACTIVATION_STATE*: jint {.`static`.}
  LISTEN_USER_MOBILE_DATA_STATE*: jint {.`static`.}
  LISTEN_DISPLAY_INFO_CHANGED*: jint {.`static`.}
  LISTEN_PHONE_CAPABILITY_CHANGE*: jint {.`static`.}
  LISTEN_ACTIVE_DATA_SUBSCRIPTION_ID_CHANGE*: jint {.`static`.}
  LISTEN_RADIO_POWER_STATE_CHANGED*: jint {.`static`.}
  LISTEN_EMERGENCY_NUMBER_LIST*: jint {.`static`.}
  LISTEN_CALL_DISCONNECT_CAUSES*: jint {.`static`.}
  LISTEN_CALL_ATTRIBUTES_CHANGED*: jint {.`static`.}
  LISTEN_IMS_CALL_DISCONNECT_CAUSES*: jint {.`static`.}
  LISTEN_OUTGOING_EMERGENCY_CALL*: jint {.`static`.}
  LISTEN_OUTGOING_EMERGENCY_SMS*: jint {.`static`.}
  LISTEN_REGISTRATION_FAILURE*: jint {.`static`.}
  LISTEN_BARRING_INFO*: jint {.`static`.}
  callback*: IPhoneStateListener

