# /mobile-pay

Implement IAP, subscriptions, purchase flows, receipt validation, and subscription state management.

## Trigger

`/mobile-pay [action] [options]`

## Actions

- `purchase` - Implement product fetch and purchase flow
- `validate` - Server-side receipt validation setup
- `restore` - Implement purchase restoration
- `subscription` - Subscription state management and renewal handling

## Options

- `--ios` - StoreKit 2 (iOS 15+)
- `--android` - Play Billing Library 6+
- `--revenuecat` - RevenueCat cross-platform
- `--type <product>` - consumable, non-consumable, subscription
- `--feature <name>` - Feature name (e.g. premium, credits)

## Process

### purchase
1. Product IDs and App Store Connect / Play Console setup requirements
2. Product fetch on subscription screen load
3. Purchase initiation and result handling
4. Transaction finishing / acknowledgment
5. Entitlement unlock

### validate
1. Server endpoint setup for receipt validation
2. iOS: App Store Server API JWT setup
3. Android: Google Play Developer API setup
4. Webhook configuration for subscription events (renewals, cancellations, refunds)

### restore
1. `AppStore.sync()` (iOS) or `queryPurchasesAsync` (Android)
2. Re-check entitlements after sync
3. Handle "nothing to restore" case gracefully
4. UI feedback during restoration

### subscription
1. Subscription status check on app launch
2. `Transaction.updates` listener for real-time status changes
3. Grace period handling — allow access while payment retries
4. Upgrade/downgrade flow (Play: `setSubscriptionUpdateParams`)
5. Cancellation handling — access until period end, not immediately

## Output

```
## Payment Implementation

### Products Required
[App Store Connect / Play Console setup]

### On Launch
[Entitlement check code]

### Purchase Flow
[Product fetch + purchase + transaction finish]

### Restoration
[Restore purchases code]

### Sandbox Testing
[StoreKit Configuration or Play test instructions]
```

## Examples

```bash
# Full iOS StoreKit 2 subscription flow
/mobile-pay subscription --ios --type subscription

# Android Play Billing consumable (coins, credits)
/mobile-pay purchase --android --type consumable

# RevenueCat cross-platform premium subscription
/mobile-pay subscription --revenuecat --feature premium

# Server-side receipt validation setup
/mobile-pay validate --ios

# Restore purchases button implementation
/mobile-pay restore --ios
```
