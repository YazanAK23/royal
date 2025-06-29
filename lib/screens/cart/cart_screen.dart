import 'package:flutter/material.dart';
import 'package:royal/widgets/custom_app_bar.dart';
import 'package:royal/widgets/custom_bottom_nav_bar.dart';
import 'package:royal/widgets/item_card.dart';
import 'package:royal/generated/l10n.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Example cart items
  final List<Map<String, dynamic>> _cartItems = List.generate(5, (index) => {
    'imagePath': 'assets/images/kitchen_sink.png',
    'title': S.current.itemKitchenSinkTitle,
    'code': S.current.itemKitchenSinkCode,
    'quantity': 12,
    'unit': index == 1 ? S.current.itemKitchenSinkUnitPACK : S.current.itemKitchenSinkUnitCTN,
    'unitDetails': S.current.itemKitchenSinkUnitDetails,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            // Centered title
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  s.cartLabel,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),
            // Back button (top left, under appbar)
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _cartItems.length,
                      itemBuilder: (context, index) {
                        final item = _cartItems[index];
                        return ItemCard(
                          imagePath: item['imagePath'],
                          title: item['title'],
                          code: item['code'],
                          quantity: item['quantity'],
                          unit: item['unit'],
                          unitDetails: item['unitDetails'],
                          onDelete: () {
                            setState(() {
                              _cartItems.removeAt(index);
                            });
                          },
                          onAdd: () {
                            setState(() {
                              item['quantity']++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (item['quantity'] > 1) item['quantity']--;
                            });
                          },
                          onUnitChanged: (val) {
                            setState(() {
                              item['unit'] = val;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          s.completeOrderButton,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: -1, // No item selected for Cart page
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorite');
          } else if (index == 2) {
            // Already on cart
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/browsing-history');
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed('/information');
          }
        },
      ),
    );
  }
}
