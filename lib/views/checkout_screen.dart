import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class CheckoutScreen extends StatefulWidget {
  final Cart cart;

  const CheckoutScreen({super.key, required this.cart});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isProcessing = false;

  Future<void> _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    // Fake delay to simulate payment processing
    await Future.delayed(const Duration(seconds: 2));

    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String orderId = 'ORD$timestamp';

    final Map<String, dynamic> confirmation = {
      'orderId': orderId,
      'totalAmount': widget.cart.totalPrice,
      'itemCount': widget.cart.countOfItems,
      'estimatedTime': '15–20 minutes',
    };

    if (mounted) {
      Navigator.pop(context, confirmation);
    }
  }

  double _calculateItemPrice(Sandwich sandwich, int quantity) {
    final PricingRepository repo = PricingRepository();
    return repo.calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: heading1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Order Summary', style: heading2),
            const SizedBox(height: 20),

            // List each item
            for (MapEntry<Sandwich, int> entry in widget.cart.items.entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${entry.value}x ${entry.key.name}',
                      style: normalText,
                    ),
                    Text(
                      '£${_calculateItemPrice(entry.key, entry.value).toStringAsFixed(2)}',
                      style: normalText,
                    ),
                  ],
                ),
              ),

            const Divider(),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: heading2),
                Text(
                  '£${widget.cart.totalPrice.toStringAsFixed(2)}',
                  style: heading2,
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              'Payment Method: Card ending in 1234',
              style: normalText,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            if (_isProcessing)
              Column(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Processing payment...',
                    style: normalText,
                  ),
                ],
              )
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _processPayment,
                  child: const Text('Confirm Payment', style: normalText),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
