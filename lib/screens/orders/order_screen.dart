import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
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
  int _selectedNav = -1;
  String? _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && args['source'] is String) {
      _source = args['source'] as String;
    } else {
      _source = null;
    }
  }

  void _handleBackNavigation() {
    debugPrint('OrderScreen: _source argument is: \\${_source}');
    if (_source == 'profile') {
      Navigator.of(context).pushReplacementNamed('/profile');
    } else if (_source == 'drawer') {
      AppRoutes.navigateTo(context, AppRoutes.customDrawer);
    } else {
      // Fallback: go to drawer menu if source is missing or unknown
      AppRoutes.navigateTo(context, AppRoutes.customDrawer);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return WillPopScope(
      onWillPop: () async {
        _handleBackNavigation();
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: CustomAppBar(
            onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
          ),
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
                      onPressed: _handleBackNavigation,
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
                        child: Text(s.ordersCurrent),
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
                        child: Text(s.ordersArchive),
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
                                children: [
                                  Text(s.orderDateSample,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  Text(s.orderNumberSample,
                                      style: const TextStyle(
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
                                        Text(s.orderItemsCount,
                                            style: const TextStyle(
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
                                            Text(s.orderStatus,
                                                style: const TextStyle(fontSize: 14)),
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
                                            tooltip: s.orderEdit,
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
                                            tooltip: s.orderDelete,
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
            currentIndex: -1, // No item selected for Orders page
            onTap: (index) {
              setState(() => _selectedNav = index);
              if (index == 0) {
                Navigator.of(context).pushReplacementNamed('/home');
              } else if (index == 1) {
                Navigator.of(context).pushReplacementNamed('/favorite');
              } else if (index == 2) {
                Navigator.of(context).pushReplacementNamed('/profile');
              } else if (index == 3) {
                Navigator.of(context).pushReplacementNamed('/downloads');
              } else if (index == 4) {
                Navigator.of(context).pushReplacementNamed('/info');
              }
            },
          ),
        ),
      ),
    );
  }
}