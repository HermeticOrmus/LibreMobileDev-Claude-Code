# Mobile Payments

Apple StoreKit 2, Google Play Billing Library 6+, RevenueCat, Stripe, subscription lifecycle management.

## What's Included

### Agents
- **mobile-payments-engineer** - Expert in StoreKit 2 async/await, Play Billing acknowledgment, RevenueCat entitlements, subscription state machine, server-side validation

### Commands
- `/mobile-pay` - Purchase flow, receipt validation, restore, subscription state management

### Skills
- **payment-patterns** - StoreKit 2 full flow Swift, Play Billing Kotlin with acknowledgment, RevenueCat iOS+Android, subscription renewal states

## Quick Start

```bash
# iOS subscription implementation
/mobile-pay subscription --ios --type subscription

# Android Play Billing setup
/mobile-pay purchase --android

# RevenueCat cross-platform
/mobile-pay subscription --revenuecat --feature premium
```

## Subscription State Machine

```
ACTIVE
  ↓ payment fails
BILLING_RETRY (grace period — keep access)
  ↓ grace period ends
EXPIRED
  ↓ user resubscribes
ACTIVE

ACTIVE → user cancels → CANCELLED (active until period end) → EXPIRED
ACTIVE → refund → REVOKED (immediately)
```

## Critical Rules

- Always call `Transaction.finish()` (iOS) — otherwise purchase stays in pending state forever
- Always call `acknowledgePurchase()` (Android) within 3 days — Play auto-refunds if not acknowledged
- Check entitlements on every app launch, not just after purchase
- Never unlock features based on purchase result alone — verify server-side or via RevenueCat
- `Transaction.updates` listener required for renewals, grace periods, and revocations
