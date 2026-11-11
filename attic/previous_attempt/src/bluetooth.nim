# bluetooth.nim - Bluetooth functionality

import android, options

type
  BluetoothDeviceType* = enum
    Classic, BLE, Dual
    
  BluetoothDeviceClass* = enum
    Computer, Phone, Headset, Imaging,
    Wearable, Toy, Health, Audio, Peripheral,
    Miscellaneous, Uncategorized
    
  BluetoothScanMode* = enum
    None, Connectable, Discoverable, DiscoverableAndConnectable
    
  BluetoothDevice* = object
    address*: string
    name*: Option[string]
    deviceType*: BluetoothDeviceType
    deviceClass*: Option[BluetoothDeviceClass]
    bondState*: string
    rssi*: Option[int]
    
  BluetoothServiceType* = enum
    GATT, SPP
    
  BluetoothGattService* = object
    uuid*: string
    isPrimary*: bool
    characteristics*: seq[string]  # UUIDs
    
  BluetoothGattCharacteristic* = object
    uuid*: string
    properties*: int
    permissions*: int
    descriptors*: seq[string]  # UUIDs
    
  BluetoothDeviceCallback* = proc(device: BluetoothDevice)
  BluetoothScanCallback* = proc(device: BluetoothDevice, rssi: int)
  BluetoothStateCallback* = proc(enabled: bool)
  BluetoothConnectionCallback* = proc(address: string, connected: bool)
  BluetoothGattCallback* = proc(address: string, serviceUuid: string, characteristicUuid: string, value: seq[byte])
    
  BluetoothManager* = ref object of Manager
    deviceCallbacks: seq[BluetoothDeviceCallback]
    scanCallbacks: seq[BluetoothScanCallback]
    stateCallbacks: seq[BluetoothStateCallback]
    connectionCallbacks: Table[string, BluetoothConnectionCallback]
    gattCallbacks: Table[string, BluetoothGattCallback]
    bluetoothAdapter: pointer  # JNI reference
    bleScanner: pointer        # JNI reference
    gattServer: pointer        # JNI reference

# Constructor
proc newBluetoothManager*(context: Context): BluetoothManager
  ## Creates a new bluetooth manager

# Bluetooth state
proc isBluetoothEnabled*(m: BluetoothManager): bool
  ## Checks if Bluetooth is enabled
  
proc enableBluetooth*(m: BluetoothManager): bool
  ## Attempts to enable Bluetooth
  ## Requires BLUETOOTH_ADMIN permission
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc registerStateCallback*(m: BluetoothManager, callback: BluetoothStateCallback)
  ## Registers for Bluetooth state changes
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc unregisterStateCallback*(m: BluetoothManager, callback: BluetoothStateCallback)
  ## Unregisters Bluetooth state callback

# Device discovery
proc getPairedDevices*(m: BluetoothManager): seq[BluetoothDevice]
  ## Gets paired Bluetooth devices
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc startDiscovery*(m: BluetoothManager, callback: BluetoothDeviceCallback): bool
  ## Starts Bluetooth device discovery
  ## API 29+: Requires ACCESS_FINE_LOCATION 
  ## API 31+: Requires BLUETOOTH_SCAN permission
  
proc stopDiscovery*(m: BluetoothManager): bool
  ## Stops Bluetooth device discovery
  ## API 31+: Requires BLUETOOTH_SCAN permission

# BLE scanning
proc startBleScan*(m: BluetoothManager, callback: BluetoothScanCallback): bool
  ## Starts BLE scan
  ## API 26+: Uses BluetoothLeScanner
  ## API 29+: Requires ACCESS_FINE_LOCATION
  ## API 31+: Requires BLUETOOTH_SCAN permission
  
proc startBleScanFiltered*(m: BluetoothManager, 
                          serviceUuids: seq[string],
                          callback: BluetoothScanCallback): bool
  ## Starts BLE scan with service UUID filter
  ## API 26+: Uses ScanFilter
  ## API 29+: Requires ACCESS_FINE_LOCATION
  ## API 31+: Requires BLUETOOTH_SCAN permission
  
proc stopBleScan*(m: BluetoothManager): bool
  ## Stops BLE scan
  ## API 31+: Requires BLUETOOTH_SCAN permission

# Device connection
proc connectToDevice*(m: BluetoothManager, 
                    address: string, 
                    serviceType: BluetoothServiceType,
                    callback: BluetoothConnectionCallback): bool
  ## Connects to Bluetooth device
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc disconnectDevice*(m: BluetoothManager, address: string): bool
  ## Disconnects from Bluetooth device
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc isConnected*(m: BluetoothManager, address: string): bool
  ## Checks if device is connected
  ## API 31+: Requires BLUETOOTH_CONNECT permission

# GATT operations
proc discoverServices*(m: BluetoothManager, address: string): seq[BluetoothGattService]
  ## Discovers GATT services
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc getCharacteristics*(m: BluetoothManager, 
                       address: string,
                       serviceUuid: string): seq[BluetoothGattCharacteristic]
  ## Gets GATT characteristics for service
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc readCharacteristic*(m: BluetoothManager,
                       address: string,
                       serviceUuid: string,
                       characteristicUuid: string): Option[seq[byte]]
  ## Reads GATT characteristic
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc writeCharacteristic*(m: BluetoothManager,
                        address: string,
                        serviceUuid: string,
                        characteristicUuid: string,
                        value: seq[byte]): bool
  ## Writes GATT characteristic
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc enableNotification*(m: BluetoothManager,
                       address: string,
                       serviceUuid: string,
                       characteristicUuid: string,
                       callback: BluetoothGattCallback): bool
  ## Enables characteristic notification
  ## API 31+: Requires BLUETOOTH_CONNECT permission
  
proc disableNotification*(m: BluetoothManager,
                        address: string,
                        serviceUuid: string, 
                        characteristicUuid: string): bool
  ## Disables characteristic notification
  ## API 31+: Requires BLUETOOTH_CONNECT permission