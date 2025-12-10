# Prompt for Implementing New Features in Sandwich Shop App

I am working on a Flutter app called **Sandwich Shop**.  
The app currently includes:

- OrderScreen (users customise sandwiches)
- CartScreen (users view items in cart)
- Models: Sandwich, Cart
- Repository: PricingRepository
- Navigation between OrderScreen → CartScreen
- Basic widget tests

## I want to add new features required by Worksheet 6:

### 1. Modify cart items
Users should be able to:
- Increase/decrease quantity of items
- Remove an item entirely
- Cart should update total price accordingly
- If quantity becomes 0, item should be removed
- UI should update immediately
- Interaction should feel similar to Deliveroo/UberEats cart pages

### 2. Add a profile screen
- New screen: ProfileScreen
- Displays basic user information
- Will later support editing (not required now)
- Accessible from a navigation drawer
- Simple placeholder layout is fine

### 3. Add a Navigation Drawer (global)
Drawer should include:
- Order Screen
- Cart Screen
- Profile Screen
- About Screen
Drawer must be accessible from all major screens.

### 4. Add a Checkout Flow
CheckoutScreen should:
- Display order summary
- Simulate payment delay
- Return confirmation data via Navigator.pop()
- Clear cart after successful checkout
- Show a success snackbar

### Requirements for AI output:
- Modify only the file I specify each time
- Provide code in small, incremental steps
- Explain each modification clearly
- Follow existing styling, structure, and naming conventions in the project
- No rewriting entire files unless explicitly told
