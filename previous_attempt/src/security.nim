# security.nim - Security and encryption

import android, options

type
  EncryptionAlgorithm* = enum
    AES, RSA, AES_GCM
    
  KeySize* = enum
    Bits128 = 128, Bits192 = 192, Bits256 = 256,
    Bits512 = 512, Bits1024 = 1024, Bits2048 = 2048,
    Bits4096 = 4096
    
  KeyPair* = object
    publicKey*: seq[byte]
    privateKey*: seq[byte]
    
  HashAlgorithm* = enum
    MD5, SHA1, SHA256, SHA384, SHA512
    
  KeyProtectionLevel* = enum
    Software, Hardware, StrongBox
    
  EncryptionPadding* = enum
    NoPadding, PKCS7, PKCS1, OAEP
    
  KeyProperties* = object
    algorithm*: EncryptionAlgorithm
    keySize*: KeySize
    isUserAuthenticationRequired*: bool
    userAuthenticationValidityDuration*: int  # seconds
    isInvalidatedByBiometricEnrollment*: bool
    protectionLevel*: KeyProtectionLevel
    
  SecurityManager* = ref object of Manager
    keyStore: pointer  # JNI reference to KeyStore
    cipher: pointer    # JNI reference to Cipher
    signature: pointer # JNI reference to Signature

# Constructor
proc newSecurityManager*(context: Context): SecurityManager
  ## Creates a new security manager

# Key management
proc generateKey*(m: SecurityManager, 
                alias: string,
                properties: KeyProperties): bool
  ## Generates encryption key
  ## API 26+: Uses KeyGenerator or KeyPairGenerator with AndroidKeyStore
  
proc deleteKey*(m: SecurityManager, alias: string): bool
  ## Deletes key
  ## API 26+: Uses KeyStore.deleteEntry
  
proc keyExists*(m: SecurityManager, alias: string): bool
  ## Checks if key exists
  ## API 26+: Uses KeyStore.containsAlias
  
proc generateKeyPair*(m: SecurityManager, 
                    alias: string,
                    properties: KeyProperties): bool
  ## Generates key pair
  ## API 26+: Uses KeyPairGenerator with AndroidKeyStore

# Encryption
proc encrypt*(m: SecurityManager, 
            data: seq[byte],
            keyAlias: string,
            padding: EncryptionPadding = PKCS7): Option[seq[byte]]
  ## Encrypts data
  ## API 26+: Uses Cipher with AndroidKeyStore
  
proc decrypt*(m: SecurityManager, 
            data: seq[byte],
            keyAlias: string,
            padding: EncryptionPadding = PKCS7): Option[seq[byte]]
  ## Decrypts data
  ## API 26+: Uses Cipher with AndroidKeyStore
  
proc encryptWithPublicKey*(m: SecurityManager,
                         data: seq[byte],
                         publicKey: seq[byte],
                         padding: EncryptionPadding = PKCS1): Option[seq[byte]]
  ## Encrypts data with RSA public key
  ## API 26+: Uses Cipher with RSA
  
proc decryptWithPrivateKey*(m: SecurityManager,
                          data: seq[byte],
                          privateKey: seq[byte],
                          padding: EncryptionPadding = PKCS1): Option[seq[byte]]
  ## Decrypts data with RSA private key
  ## API 26+: Uses Cipher with RSA

# Hashing and signing
proc hash*(m: SecurityManager, 
         data: seq[byte],
         algorithm: HashAlgorithm): seq[byte]
  ## Hashes data with specified algorithm
  ## API 26+: Uses MessageDigest
  
proc sign*(m: SecurityManager, 
         data: seq[byte],
         keyAlias: string): Option[seq[byte]]
  ## Signs data with private key
  ## API 26+: Uses Signature with AndroidKeyStore
  
proc verify*(m: SecurityManager, 
           data: seq[byte],
           signature: seq[byte],
           keyAlias: string): bool
  ## Verifies signature with public key
  ## API 26+: Uses Signature with AndroidKeyStore

# Secure storage
proc storeSecureString*(m: SecurityManager, key: string, value: string): bool
  ## Stores string securely
  ## API 26+: Uses EncryptedSharedPreferences
  ## API 28+: Uses StrongBox if available
  
proc getSecureString*(m: SecurityManager, key: string): Option[string]
  ## Retrieves securely stored string
  ## API 26+: Uses EncryptedSharedPreferences
  
proc removeSecureValue*(m: SecurityManager, key: string): bool
  ## Removes securely stored value
  ## API 26+: Uses EncryptedSharedPreferences.remove

# Certificate management
proc getCertificate*(m: SecurityManager, alias: string): Option[seq[byte]]
  ## Gets certificate
  ## API 26+: Uses KeyStore.getCertificate
  
proc importCertificate*(m: SecurityManager, alias: string, certificate: seq[byte]): bool
  ## Imports certificate
  ## API 26+: Uses KeyStore.setCertificateEntry