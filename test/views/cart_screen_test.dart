import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/views/profile_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/app_styles.dart';

void main() {
  group('CartScreen', () {
    testWidgets('displays empty cart message when cart is empty',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();
      final CartScreen cartScreen = CartScreen(cart: emptyCart);
      final MaterialApp app = MaterialApp(home: cartScreen);

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text('Total: £0.00'), findsOneWidget);
    });

    testWidgets('displays cart items when cart has items',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(sandwich, quantity: 2);

      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartScreen);
      await tester.pumpWidget(app);

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Qty: 2 - £22.00'), findsOneWidget);
      expect(find.text('Total: £22.00'), findsOneWidget);
    });

    testWidgets('displays multiple cart items correctly',
        (WidgetTester tester) async {
      final Cart cart = Cart();

      final Sandwich s1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      final Sandwich s2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.add(s1, quantity: 1);
      cart.add(s2, quantity: 3);

      final CartScreen screen = CartScreen(cart: cart);
      await tester.pumpWidget(MaterialApp(home: screen));

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);

      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Six-inch on wheat bread'), findsOneWidget);

      expect(find.text('Qty: 1 - £11.00'), findsOneWidget);
      expect(find.text('Qty: 3 - £21.00'), findsOneWidget);
      expect(find.text('Total: £32.00'), findsOneWidget);
    });

    testWidgets('back button exists and is enabled', (WidgetTester tester) async {
      final Cart cart = Cart();
      final CartScreen screen = CartScreen(cart: cart);
      await tester.pumpWidget(MaterialApp(home: screen));

      final Finder backButtonFinder =
          find.widgetWithText(StyledButton, 'Back to Order');

      expect(backButtonFinder, findsOneWidget);

      final StyledButton backButton =
          tester.widget<StyledButton>(backButtonFinder);

      expect(backButton.onPressed, isNotNull);
    });

    testWidgets('displays logo in app bar', (WidgetTester tester) async {
      final Cart cart = Cart();
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);

      final imageFinder =
          find.descendant(of: appBarFinder, matching: find.byType(Image));

      expect(imageFinder, findsOneWidget);

      final Image logo = tester.widget(imageFinder);
      expect(
        (logo.image as AssetImage).assetName,
        'assets/images/logo.png',
      );
    });

    // 🔥 NEW REQUIRED TEST — Drawer navigation exists
    testWidgets('drawer contains navigation options',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      // Open drawer
      ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle();

      expect(find.text('Menu'), findsOneWidget);
      expect(find.text('Order'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
    });

    // 🔥 NEW REQUIRED TEST — Checkout button appears only with items
    testWidgets('checkout button only appears when cart has items',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: emptyCart)));

      expect(find.text('Checkout'), findsNothing);

      final Cart cart = Cart();
      cart.add(
        Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        ),
      );

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      expect(find.text('Checkout'), findsOneWidget);
    });
  });
}
