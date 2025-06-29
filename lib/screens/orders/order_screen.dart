import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_assets.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedTab = 1;
  int _selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            // Back button under the appbar, left side
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppAssets.backButton,
                      width: 28,
                      height: 28,
                      color: Colors.blue,
                    ),
                    onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _selectedTab = 1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _selectedTab == 1 ? Colors.blue : Colors.grey[200],
                        foregroundColor:
                            _selectedTab == 1 ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('الطلبات الحالية'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _selectedTab = 0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _selectedTab == 0 ? Colors.blue : Colors.grey[200],
                        foregroundColor:
                            _selectedTab == 0 ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('أرشيف الطلبات'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final isDelivered = index % 2 == 0;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.orderDetails);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF03A9F4),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('12/12/2022',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Text('#5022201',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('٢٨ صنف',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            isDelivered
                                                ? AppAssets.delivered
                                                : AppAssets.notDelivered,
                                            width: 19,
                                            height: 13,
                                          ),
                                          const SizedBox(width: 6),
                                          const Text('حالة الطلبية',
                                              style: TextStyle(fontSize: 14)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (isDelivered) ...[
                                  const SizedBox(width: 16),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: const Color(0xFF03A9F4),
                                        child: IconButton(
                                          icon: const Icon(Icons.edit,
                                              color: Colors.white, size: 18),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: const Color(0xFF03A9F4),
                                        child: IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.white, size: 18),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedNav,
          onTap: (index) => setState(() => _selectedNav = index),
        ),
      ),
    );
  }
}