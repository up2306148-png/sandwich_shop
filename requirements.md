# Requirements Document — Sandwich Shop App Enhancements

## 1. Feature Description
The app must support an improved shopping flow with editable cart items, a profile screen, a checkout process, and shared navigation via a Drawer.

## 2. User Stories

### Cart Modification
- As a user, I want to increase/decrease the quantity of items in my cart so I can edit my order.
- As a user, I want to remove items from my cart if I no longer want them.
- As a user, I want the cart total to update instantly when changes are made.

### Profile Screen
- As a user, I want to view a simple Profile page with placeholder user info.

### Checkout Flow
- As a user, I want to confirm my order and see a processing screen.
- As a user, I want to see a confirmation message with an order ID and estimate.

### Navigation Drawer
- As a user, I want a drawer on all major screens for quick navigation.

## 3. Acceptance Criteria

### Cart
- Quantity buttons modify the model and UI immediately.
- Removing an item updates the cart and total.
- Tests cover quantity changes and item removal.

### Profile Screen
- Screen loads correctly with placeholder info.
- A working navigation entry opens it.

### Checkout
- Button navigates to CheckoutScreen.
- Payment simulates a 2-second delay.
- Returns confirmation map via Navigator.pop.
- Cart clears afterward.
- Snackbar appears with correct formatting.

### Drawer
- Drawer is accessible on Order, Cart, Profile screens.
- Links navigate correctly.
- Tests verify drawer presence and navigation.
