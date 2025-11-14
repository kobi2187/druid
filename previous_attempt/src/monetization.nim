# monetization.nim - In-app purchases and subscriptions

import android, options

type
  ProductType* = enum
    OneTime, Subscription
    
  SubscriptionPeriod* = enum
    Weekly, Monthly, ThreeMonth, SixMonth, Annual
    
  SubscriptionOption* = enum
    Base, Intro, Promo
    
  OfferType* = enum
    FreeTrial, DiscountedPrice, ExistingPlanUpgrade
    
  ProductDetails* = object
    id*: string
    title*: string
    description*: string
    price*: string
    priceAmountMicros*: int64
    priceCurrencyCode*: string
    case productType*: ProductType
    of OneTime:
      consumable*: bool
    of Subscription:
      period*: SubscriptionPeriod
      freeTrialPeriod*: Option[string]
      introductoryPrice*: Option[string]
      introductoryPriceAmountMicros*: Option[int64]
      introductoryPricePeriod*: Option[string]
      
  PurchaseState* = enum
    Purchased, Canceled, Pending
    
  PurchaseDetails* = object
    orderId*: string
    packageName*: string
    productId*: string
    purchaseTime*: Time
    purchaseToken*: string
    state*: PurchaseState
    isAcknowledged*: bool
    developerPayload*: Option[string]
    accountId*: Option[string]
    
  BillingResponse* = enum
    OK, UserCanceled, ServiceUnavailable, BillingUnavailable,
    ItemUnavailable, DeveloperError, Error, ItemAlreadyOwned,
    ItemNotOwned
    
  BillingFlowParams* = object
    productId*: string
    offerToken*: Option[string]
    accountId*: Option[string]
    
  PurchaseListener* = proc(purchase: PurchaseDetails, response: BillingResponse)
  ProductDetailsListener* = proc(products: seq[ProductDetails], response: BillingResponse)
  PurchaseHistoryListener* = proc(purchases: seq[PurchaseDetails], response: BillingResponse)
    
  MonetizationManager* = ref object of Manager
    billingClient: pointer  # JNI reference
    purchaseListeners: seq[PurchaseListener]
    activity: Option[Activity]
    isConnected: bool

# Constructor
proc newMonetizationManager*(context: Context, activity: Option[Activity] = none(Activity)): MonetizationManager
  ## Creates a new monetization manager
  ## Activity required for purchase flows

# Billing client
proc connect*(m: MonetizationManager, onConnected: proc(success: bool)): bool
  ## Connects to billing service
  ## API 26+: Uses BillingClient.startConnection
  
proc disconnect*(m: MonetizationManager): bool
  ## Disconnects from billing service
  ## API 26+: Uses BillingClient.endConnection
  
proc isReady*(m: MonetizationManager): bool
  ## Checks if billing client is ready
  ## API 26+: Uses BillingClient.isReady

# Product queries
proc queryProductDetails*(m: MonetizationManager,
                        productIds: seq[string],
                        productType: ProductType,
                        listener: ProductDetailsListener): bool
  ## Queries product details
  ## API 26+: Uses BillingClient.queryProductDetailsAsync
  
proc queryPurchases*(m: MonetizationManager,
                   productType: ProductType,
                   listener: proc(purchases: seq[PurchaseDetails], response: BillingResponse)): bool
  ## Queries existing purchases
  ## API 26+: Uses BillingClient.queryPurchasesAsync
  
proc queryPurchaseHistory*(m: MonetizationManager,
                         productType: ProductType,
                         listener: PurchaseHistoryListener): bool
  ## Queries purchase history
  ## API 26+: Uses BillingClient.queryPurchaseHistoryAsync

# Purchase flow
proc launchBillingFlow*(m: MonetizationManager,
                      params: BillingFlowParams): BillingResponse
  ## Launches purchase flow
  ## API 26+: Uses BillingClient.launchBillingFlow
  ## Requires activity
  
proc registerPurchaseListener*(m: MonetizationManager, listener: PurchaseListener): bool
  ## Registers for purchase updates
  ## API 26+: Uses PurchasesUpdatedListener
  
proc unregisterPurchaseListener*(m: MonetizationManager, listener: PurchaseListener): bool
  ## Unregisters purchase listener
  ## API 26+: Removes from internal list

# Purchase management
proc acknowledgePurchase*(m: MonetizationManager, 
                        purchaseToken: string,
                        callback: proc(response: BillingResponse)): bool
  ## Acknowledges purchase
  ## API 26+: Uses BillingClient.acknowledgePurchase
  
proc consumePurchase*(m: MonetizationManager,
                    purchaseToken: string,
                    callback: proc(response: BillingResponse)): bool
  ## Consumes purchase
  ## API 26+: Uses BillingClient.consumeAsync
  
proc isFeaturePurchased*(m: MonetizationManager, productId: string): Future[bool]
  ## Checks if feature is purchased
  ## API 26+: Uses queryPurchasesAsync and checks results