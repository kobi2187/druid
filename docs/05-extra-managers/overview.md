# Extra Managers Overview

## Purpose

Extra Managers provide advanced features for specific use cases: biometrics, Bluetooth, NFC, telephony, cryptography, etc. These are optional but powerful capabilities.

## The 8 Extra Managers

### 1. BiometricManager
**Priority**: MEDIUM
**Use Cases**: Secure login, payment authorization, sensitive data access

**APIs**:
- `hasBiometric(): bool`
- `getBiometricType(): BiometricType` (Fingerprint, Face, Iris)
- `authenticate(prompt: BiometricPrompt): Future[AuthResult]`
- `canAuthenticate(): BiometricCapability`

**Implementation**: ~400 LOC
**Features**: BiometricPrompt API (API 28+), FingerprintManager fallback, secure authentication
**Doc**: [BiometricManager.md](BiometricManager.md)

---

### 2. BluetoothManager
**Priority**: MEDIUM
**Use Cases**: IoT devices, peripherals, file transfer, audio streaming

**APIs**:
- `isBluetoothEnabled(): bool`
- `enableBluetooth()`
- `scan(callback: proc(device: BluetoothDevice))`
- `connect(device: BluetoothDevice): BluetoothConnection`
- `sendData(conn: BluetoothConnection, data: seq[byte])`

**Implementation**: ~800 LOC
**Features**:
- Classic Bluetooth and BLE
- Device scanning and pairing
- GATT client/server
- Data transfer

**Doc**: [BluetoothManager.md](BluetoothManager.md)

---

### 3. NFCManager
**Priority**: LOW
**Use Cases**: Contactless payments, tag reading, peer-to-peer data exchange

**APIs**:
- `isNfcEnabled(): bool`
- `readTag(callback: proc(tag: NfcTag))`
- `writeTag(tag: NfcTag, data: seq[byte])`
- `enableReaderMode()`

**Implementation**: ~400 LOC
**Features**: NFC tag reading/writing, NDEF messages, card emulation
**Doc**: [NFCManager.md](NFCManager.md)

---

### 4. TelephonyManager
**Priority**: LOW-MEDIUM
**Use Cases**: Phone calls, SMS, network info, SIM card data

**APIs**:
- `makePhoneCall(number: string)`
- `sendSMS(number: string, message: string)`
- `onIncomingCall(callback: proc(number: string))`
- `getNetworkOperator(): string`
- `getSimCountryIso(): string`

**Implementation**: ~500 LOC
**Features**:
- Phone call intents
- SMS sending/receiving
- Network operator info
- SIM card data

**Doc**: [TelephonyManager.md](TelephonyManager.md)

---

### 5. CryptographyManager
**Priority**: HIGH (for security-focused apps)
**Use Cases**: Data encryption, secure storage, key management

**APIs**:
- `encrypt(data: seq[byte], key: CryptoKey): seq[byte]`
- `decrypt(data: seq[byte], key: CryptoKey): seq[byte]`
- `generateKey(algorithm: CryptoAlgorithm): CryptoKey`
- `storeKeyInKeystore(alias: string, key: CryptoKey)`
- `hash(data: seq[byte], algorithm: HashAlgorithm): seq[byte]`

**Implementation**: ~600 LOC
**Features**:
- AES encryption/decryption
- RSA public/private key crypto
- Android Keystore integration
- SHA/MD5 hashing
- Secure random number generation

**Doc**: [CryptographyManager.md](CryptographyManager.md)

---

### 6. FileManager
**Priority**: MEDIUM
**Use Cases**: Advanced file operations beyond basic storage

**APIs**:
- `listFiles(dir: string): seq[FileInfo]`
- `copyFile(src: string, dst: string)`
- `moveFile(src: string, dst: string)`
- `deleteFile(path: string)`
- `createDirectory(path: string)`
- `watchDirectory(path: string, callback: proc(event: FileEvent))`

**Implementation**: ~400 LOC
**Features**:
- File operations with error handling
- Directory watching (FileObserver)
- File metadata (size, modified time, permissions)
- Scoped storage compatibility

**Doc**: [FileManager.md](FileManager.md)

---

### 7. DownloadManager
**Priority**: MEDIUM
**Use Cases**: Large file downloads, background downloads, queued downloads

**APIs**:
- `download(url: string, dest: string): DownloadId`
- `getProgress(id: DownloadId): DownloadProgress`
- `cancel(id: DownloadId)`
- `onDownloadComplete(id: DownloadId, callback: proc())`

**Implementation**: ~300 LOC
**Features**:
- Android DownloadManager wrapper
- Progress tracking
- Notification integration
- Network type restrictions (WiFi only)

**Doc**: [DownloadManager.md](DownloadManager.md)

---

### 8. AnalyticsManager
**Priority**: MEDIUM (for production apps)
**Use Cases**: Usage tracking, crash reporting, user analytics

**APIs**:
- `logEvent(eventName: string, params: Table[string, string])`
- `setUserProperty(name: string, value: string)`
- `logScreenView(screenName: string)`
- `logError(error: Exception)`

**Implementation**: ~300 LOC
**Features**:
- Abstraction over multiple analytics backends (Firebase, custom)
- Event batching
- User properties
- Error logging

**Doc**: [AnalyticsManager.md](AnalyticsManager.md)

---

## Implementation Complexity

### Simple (< 400 LOC)
- DownloadManager
- AnalyticsManager
- NFCManager

### Moderate (400-600 LOC)
- BiometricManager
- FileManager
- CryptographyManager

### Complex (600+ LOC)
- BluetoothManager (most complex)
- TelephonyManager

---

## Dependencies

```
BiometricManager
  └─> PermissionManager (USE_BIOMETRIC)

BluetoothManager
  └─> PermissionManager (BLUETOOTH, BLUETOOTH_ADMIN, ACCESS_FINE_LOCATION)
  └─> PackageManager (BLE feature detection)

NFCManager
  └─> PermissionManager (NFC)
  └─> PackageManager (NFC feature detection)

TelephonyManager
  └─> PermissionManager (CALL_PHONE, READ_PHONE_STATE, SEND_SMS, etc.)

CryptographyManager
  └─> (none - self-contained)

FileManager
  └─> StorageManager (file paths)
  └─> PermissionManager (storage permissions)

DownloadManager
  └─> NetworkManager (connection checking)
  └─> StorageManager (download paths)
  └─> NotificationManager (download notifications)

AnalyticsManager
  └─> NetworkManager (uploading events)
  └─> PackageManager (app version)
```

---

## Security Considerations

### BiometricManager
- Use BiometricPrompt for secure authentication
- Never cache authentication results
- Require re-authentication for sensitive operations
- Handle biometric enrollment changes

### CryptographyManager
- Use Android Keystore for key storage
- Never hardcode encryption keys
- Use proper key derivation functions
- Implement key rotation
- Clear sensitive data from memory

### TelephonyManager
- Request minimal permissions
- Handle phone number privacy
- Validate phone numbers before calling/texting
- Respect user's call/SMS blocklists

### General
- Request permissions only when needed
- Explain why permissions are needed
- Handle permission denials gracefully
- Follow Android security best practices

---

## Testing Challenges

### Hardware Dependencies

| Manager | Real Device Required | Why |
|---------|---------------------|-----|
| BiometricManager | Yes | Fingerprint sensor needed |
| BluetoothManager | Yes | BLE hardware required |
| NFCManager | Yes | NFC chip required |
| TelephonyManager | Yes | SIM card & phone capability |
| CryptographyManager | No | Can test on emulator |
| FileManager | No | Filesystem available |
| DownloadManager | No | Can mock network |
| AnalyticsManager | No | Can use test backend |

### Testing Strategies

**BiometricManager**:
- Test on devices with different biometric types
- Test enrollment/unenrollment scenarios
- Test authentication cancellation

**BluetoothManager**:
- Test device scanning
- Test pairing flow
- Test data transfer
- Requires 2+ Bluetooth devices

**NFCManager**:
- Use NFC tags for testing
- Test different tag types (NDEF, ISO14443, etc.)
- Test reader/writer modes

**TelephonyManager**:
- Use test phone numbers
- Test SMS in emulator
- Test SIM card presence detection

**CryptographyManager**:
- Extensive unit tests for crypto operations
- Test key persistence across app restarts
- Test on different API levels (Keystore changes)

**FileManager**:
- Test scoped storage (API 29+)
- Test permission flows
- Test with external storage mounted/unmounted

---

## Example: Secure Login Flow

```nim
import druid
import asyncdispatch

proc setupSecureLogin() {.async.} =
  # Check if biometric auth available
  let biometric = biometric()

  if not biometric.hasBiometric():
    echo "Biometric not available, falling back to PIN"
    return

  # Show biometric prompt
  let prompt = BiometricPrompt(
    title: "Login to App",
    subtitle: "Authenticate with your fingerprint",
    description: "Touch the sensor to log in",
    negativeButton: "Use PIN"
  )

  let result = await biometric.authenticate(prompt)

  case result.status:
  of Success:
    echo "Authenticated successfully"

    # Get stored encrypted token
    let encryptedToken = readEncryptedToken()

    # Decrypt with biometric-protected key
    let crypto = crypto()
    let key = crypto.getKeyFromKeystore("login_key")
    let token = crypto.decrypt(encryptedToken, key)

    # Login with token
    await loginWithToken(token)

  of Failed:
    echo "Authentication failed"

  of Cancelled:
    echo "User cancelled"

  of Error:
    echo "Biometric error: ", result.errorMessage

proc storeLoginToken(token: string) =
  # Generate encryption key in Keystore
  let crypto = crypto()
  let key = crypto.generateKey(AES256)
  crypto.storeKeyInKeystore("login_key", key,
    requireBiometric = true)  # Key requires biometric to use

  # Encrypt token
  let encrypted = crypto.encrypt(token.toBytes, key)

  # Store encrypted token
  storage().writeFile("token.enc", encrypted)
```

---

## Example: IoT Device Communication

```nim
import druid
import asyncdispatch

proc connectToIoTDevice() {.async.} =
  # Check Bluetooth availability
  let bt = bluetooth()

  if not bt.isBluetoothEnabled():
    echo "Please enable Bluetooth"
    return

  # Request permissions
  let perms = @[BLUETOOTH, BLUETOOTH_ADMIN, ACCESS_FINE_LOCATION]
  let granted = await permissions().requestPermissions(perms)

  if not granted.allTrue:
    echo "Bluetooth permissions denied"
    return

  # Scan for devices
  echo "Scanning for devices..."
  var devices: seq[BluetoothDevice]

  bt.scan() do (device: BluetoothDevice):
    if device.name.contains("MyIoTDevice"):
      devices.add(device)

  await sleepAsync(5000)  # Scan for 5 seconds
  bt.stopScan()

  if devices.len == 0:
    echo "No devices found"
    return

  # Connect to first device
  echo "Connecting to ", devices[0].name
  let conn = await bt.connect(devices[0])

  # Send command
  let command = @[0x01'u8, 0x02'u8, 0x03'u8]  # Turn on
  await bt.sendData(conn, command)

  # Receive response
  bt.onDataReceived(conn) do (data: seq[byte]):
    echo "Received: ", data

  # Keep connection alive
  await sleepAsync(60000)  # 1 minute

  # Disconnect
  bt.disconnect(conn)
```

---

## Success Criteria

- [ ] All 8 extra managers implemented
- [ ] Security best practices followed
- [ ] Tested on real hardware
- [ ] Graceful handling of unavailable features
- [ ] Comprehensive error handling
- [ ] Example apps for each manager
- [ ] Security audit passed (for crypto/biometric)

---

## Next Steps

1. Prioritize based on app needs
2. Start with CryptographyManager (widely useful)
3. Implement BiometricManager (common security feature)
4. Add Bluetooth/NFC if IoT app
5. Add Telephony if communication app
6. FileManager and DownloadManager for content apps
7. AnalyticsManager for production apps

---

**See individual manager docs for detailed implementation specs**.
