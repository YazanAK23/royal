import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_bottom_nav_bar.dart';
import '../../../widgets/item_card.dart';
import '../../../core/routes/app_routes.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.orders),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              s.itemOrderTitle,
              style: const TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Text(
              s.itemOrderNumber,
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) => ItemCard(
                  imagePath: 'assets/images/kitchen_sink.png',
                  title: s.itemKitchenSinkTitle,
                  code: s.itemKitchenSinkCode,
                  quantity: 12,
                  unit: s.itemKitchenSinkUnitCTN,
                  unitDetails: s.itemKitchenSinkUnitDetails,
                  onDelete: () {},
                  onAdd: () {},
                  onRemove: () {},
                  onUnitChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: 220,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ECC40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s.itemSave, style: const TextStyle(fontSize: 20, color: Colors.white)),
                      const SizedBox(width: 8),
                      const Icon(Icons.check, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    );
  }
}
