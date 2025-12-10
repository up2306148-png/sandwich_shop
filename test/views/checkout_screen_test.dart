import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';

void main() {
  testWidgets('CheckoutScreen builds with a non-empty cart', (tester) async {
    // Arrange: create a cart with one item
    final cart = Cart();
    cart.add(
      Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      ),
      quantity: 1,
    );

    // Act: pump the CheckoutScreen inside a MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: CheckoutScreen(cart: cart),
      ),
    );

    await tester.pump(); // let the first frame build

    // Assert: the screen is in the tree and basic text is present
    expect(find.byType(CheckoutScreen), findsOneWidget);
    expect(find.text('Checkout'), findsOneWidget);
    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('Confirm Payment'), findsOneWidget);
  });
}
