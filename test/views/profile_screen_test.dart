import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  testWidgets('Profile screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Alex Morgan'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
  });
}
