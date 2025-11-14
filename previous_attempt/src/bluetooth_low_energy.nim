# bluetooth_low_energy.nim - Bluetooth Low Energy specific operations

import android, options

type
  BleScanMode* = enum
    Opportunistic, LowPower, Balanced, LowLatency
    
  BleAdvertiseMode* = enum
    LowPower, Balanced, LowLatency
    
  BleScanFilter* = object
    deviceAddress*: Option[string]
    deviceName*: Option[string]
    serviceUuids*: seq[string]
    serviceData*: Table[string, seq[byte]]
    manufacturerData*: Table[int, seq[byte]]
    
  BleAdvertiseSettings* = object
    mode*: BleAdvertiseMode
    connectable*: bool
    timeout*: int  # milliseconds, 0 = no timeout
    
  BleAdvertiseData* = object
    serviceUuids*: seq[string]
    serviceData*: Table[string, seq[byte]]
    manufacturerData*: Table[int, seq[byte]]
    includeTxPower*: bool
    includeDeviceName*: bool
    
  BleGattService* = object
    uuid*: string
    isPrimary*: bool
    characteristics*: seq[BleGattCharacteristic]
    
  BleGattCharacteristic* = object
    uuid*: string
    properties*: set[BleCharacteristicProperty]
    permissions*: set[BleCharacteristicPermission]
    value*: seq[byte]
    descriptors*: seq[BleGattDescriptor]
    
  BleGattDescriptor* = object
    uuid*: string
    permissions*: set[BleDescriptorPermission]
    value*: seq[byte]
    
  BleConnectionState* = enum
    Disconnected, Connecting, Connected, Disconnecting
    
  BleCharacteristicProperty* = enum
    Broadcast, Read, WriteNoResponse, Write, Notify, Indicate, SignedWrite, ExtendedProps
    
  BleCharacteristicPermission* = enum
    Read, ReadEncrypted, ReadEncryptedMitm, Write, WriteEncrypted, WriteEncryptedMitm, WriteSignedMitm
    
  BleDescriptorPermission* = enum
    Read, ReadEncrypted, ReadEncryptedMitm, Write, WriteEncrypted, WriteEncryptedMitm
    
  BleDevice* = object
    address*: string
    name*: Option[string]
    rssi*: Option[int]
    scanRecord*: Option[seq[byte]]
    advertisedServiceUuids*: seq[string]
    
  BleScanCallback* = proc(device: BleDevice)
  BleAdvertiseCallback* = proc(success: bool, errorCode: Option[int])
  BleConnectionStateCallback* = proc(device: string, state: BleConnectionState)
  BleServicesDiscoveredCallback* = proc(device: string, services: seq[BleGattService])
  BleCharacteristicReadCallback* = proc(device: string, characteristic: BleGattCharacteristic, status: int)
  BleCharacteristicWriteCallback* = proc(device: string, characteristic: BleGattCharacteristic, status: int)
  BleCharacteristicChangedCallback* = proc(device: string, characteristic: BleGattCharacteristic)
  BleDescriptorReadCallback* = proc(device: string, descriptor: BleGattDescriptor, status: int)
  BleDescriptorWriteCallback* = proc(device: string, descriptor: BleGattDescriptor, status: int)
    
  BleManager* = ref object of Manager
    bluetoothAdapter: pointer  # JNI reference
    scanner: pointer  # JNI reference
    advertiser: pointer  # JNI reference
    gattServers: Table[string, pointer]  # JNI references to GATT servers
    gattClients: Table[string, pointer]  # JNI references to GATT clients
    scanCallbacks: seq[BleScanCallback]
    advertiseCallbacks: Table[string, BleAdvertiseCallback]
    connectionStateCallbacks: Table[string, BleConnectionStateCallback]
    servicesDiscoveredCallbacks: Table[string, BleServicesDiscoveredCallback]
    characteristicReadCallbacks: Table[string, BleCharacteristicReadCallback]
    characteristicWriteCallbacks: Table[string, BleCharacteristicWriteCallback]
    characteristicChangedCallbacks: Table[string, Table[string, BleCharacteristicChangedCallback]]
    descriptorReadCallbacks: Table[string, BleDescriptorReadCallback]
    descriptorWriteCallbacks: Table[string, BleDescriptorWriteCallback]

# Constructor
proc newBleManager*(context: Context): BleManager
  ## Creates a new BLE manager

# Scanning
proc startScan*(m: BleManager, 
              callback: BleScanCallback,
              filters: seq[BleScanFilter] = @[],
              scanMode: BleScanMode = Balanced): bool
  ## Starts BLE scan
  ## API 26+: Uses BluetoothLeScanner
  ## API 29+: Requires ACCESS_FINE_LOCATION
  ## API 31+: Requires BLUETOOTH_SCAN permission
  
proc stopScan*(m: BleManager): bool
  ## Stops BLE scan
  ## API 26+: Uses BluetoothLeScanner.stopScan
  ## API 31+: Requires BLUETOOTH_SCAN permission

# Advertising
proc startAdvertising*(m: BleManager,
                     data: BleAdvertiseData,
                     settings: BleAdvertiseSettings,
                     callback: BleAdvertiseCallback): string
  ## Starts BLE advertising
  ## Returns advertise ID
  ## API 26+: Uses BluetoothLeAdvertiser
  ## API 31+: Requires BLUETOOTH_ADVERTISE permission
  
proc stopAdvertising*(m: BleManager, advertiseId: string): bool
  ## Stops BLE advertising
  ## API 26+: Uses BluetoothLeAdvertiser.stopAdvertising
  ## API 31+: Requires BLUETOOTH_ADVERTISE permission

# GATT Client operations
proc connectGatt*(m: BleManager, 
                deviceAddress: string,
                autoConnect: bool,
                connectionStateCallback: BleConnectionStateCallback,
                servicesDiscoveredCallback: BleServicesDiscoveredCallback): bool
  ## Connects to GATT server
  ## API 26+: Uses BluetoothDevice.connectGatt
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc disconnectGatt*(m: BleManager, deviceAddress: string): bool
  ## Disconnects from GATT server
  ## API 26+: Uses BluetoothGatt.disconnect
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc discoverServices*(m: BleManager, deviceAddress: string): bool
  ## Discovers GATT services
  ## API 26+: Uses BluetoothGatt.discoverServices
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc readCharacteristic*(m: BleManager, 
                       deviceAddress: string,
                       serviceUuid: string,
                       characteristicUuid: string,
                       callback: BleCharacteristicReadCallback): bool
  ## Reads characteristic
  ## API 26+: Uses BluetoothGatt.readCharacteristic
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc writeCharacteristic*(m: BleManager,
                        deviceAddress: string,
                        serviceUuid: string,
                        characteristicUuid: string,
                        value: seq[byte],
                        callback: BleCharacteristicWriteCallback): bool
  ## Writes characteristic
  ## API 26+: Uses BluetoothGatt.writeCharacteristic
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc setCharacteristicNotification*(m: BleManager,
                                  deviceAddress: string,
                                  serviceUuid: string,
                                  characteristicUuid: string,
                                  enable: bool,
                                  callback: BleCharacteristicChangedCallback): bool
  ## Enables/disables characteristic notification
  ## API 26+: Uses BluetoothGatt.setCharacteristicNotification
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc readDescriptor*(m: BleManager,
                   deviceAddress: string,
                   serviceUuid: string,
                   characteristicUuid: string,
                   descriptorUuid: string,
                   callback: BleDescriptorReadCallback): bool
  ## Reads descriptor
  ## API 26+: Uses BluetoothGatt.readDescriptor
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc writeDescriptor*(m: BleManager,
                    deviceAddress: string,
                    serviceUuid: string,
                    characteristicUuid: string,
                    descriptorUuid: string,
                    value: seq[byte],
                    callback: BleDescriptorWriteCallback): bool
  ## Writes descriptor
  ## API 26+: Uses BluetoothGatt.writeDescriptor
  ## API 31+: Requires BLUETOOTH_CONNECT permission

# GATT Server operations
proc createGattServer*(m: BleManager, 
                     connectionStateCallback: BleConnectionStateCallback): string
  ## Creates GATT server
  ## Returns server ID
  ## API 26+: Uses BluetoothManager.openGattServer
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc closeGattServer*(m: BleManager, serverId: string): bool
  ## Closes GATT server
  ## API 26+: Uses BluetoothGattServer.close
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc addService*(m: BleManager, 
               serverId: string,
               service: BleGattService): bool
  ## Adds service to GATT server
  ## API 26+: Uses BluetoothGattServer.addService
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc removeService*(m: BleManager,
                  serverId: string,
                  serviceUuid: string): bool
  ## Removes service from GATT server
  ## API 26+: Uses BluetoothGattServer.removeService
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc sendResponse*(m: BleManager,
                 serverId: string,
                 deviceAddress: string,
                 requestId: int,
                 status: int,
                 value: seq[byte]): bool
  ## Sends response to client
  ## API 26+: Uses BluetoothGattServer.sendResponse
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc notifyCharacteristicChanged*(m: BleManager,
                                serverId: string,
                                deviceAddress: string,
                                serviceUuid: string,
                                characteristicUuid: string,
                                value: seq[byte],
                                confirm: bool): bool
  ## Notifies characteristic change
  ## API 26+: Uses BluetoothGattServer.notifyCharacteristicChanged
  ## API 31+: Requires BLUETOOTH_CONNECT permission