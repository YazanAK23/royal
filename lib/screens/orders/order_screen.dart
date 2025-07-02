import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
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

  // Order status data for demo
  final List<Map<String, dynamic>> _orders = [
    {
      'date': S.current.orderDateSample,
      'number': S.current.orderNumberSample,
      'items': S.current.orderItemsSample,
      'status': S.current.statusReady,
    },
    {
      'date': S.current.orderDateSample,
      'number': S.current.orderNumberSample,
      'items': S.current.orderItemsSample,
      'status': S.current.statusCancelled,
    },
    {
      'date': S.current.orderDateSample,
      'number': S.current.orderNumberSample,
      'items': S.current.orderItemsSample,
      'status': S.current.statusPreparing,
    },
    {
      'date': S.current.orderDateSample,
      'number': S.current.orderNumberSample,
      'items': S.current.orderItemsSample,
      'status': S.current.statusReady,
    },
    {
      'date': S.current.orderDateSample,
      'number': S.current.orderNumberSample,
      'items': S.current.orderItemsSample,
      'status': S.current.statusCancelled,
    },
  ];

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
      AppRoutes.navigateTo(context, AppRoutes.customDrawer);
    }
  }

  Widget _buildStatusChip(String status) {
    final s = S.of(context);
    if (status == s.statusReady) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF4CAF50),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.statusReady, style: const TextStyle(color: Colors.white, fontSize: 15)),
            const SizedBox(width: 4),
            const Icon(Icons.check_circle, color: Colors.white, size: 18),
          ],
        ),
      );
    } else if (status == s.statusCancelled) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF44336),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.statusCancelled, style: const TextStyle(color: Colors.white, fontSize: 15)),
            const SizedBox(width: 4),
            const Icon(Icons.cancel, color: Colors.white, size: 18),
          ],
        ),
      );
    } else if (status == s.statusPreparing) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF233A63),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.statusPreparing, style: const TextStyle(color: Colors.white, fontSize: 15)),
            const SizedBox(width: 4),
            const Icon(Icons.settings, color: Colors.white, size: 18),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    // Detect text direction from locale
    final isRTL = Directionality.of(context) == TextDirection.rtl || Localizations.localeOf(context).languageCode == 'ar';
    return WillPopScope(
      onWillPop: () async {
        _handleBackNavigation();
        return false;
      },
      child: Directionality(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: CustomAppBar(
            onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
          ),
          body: Column(
            children: [
              const SizedBox(height: 12),
              // Title
              Text(
                s.ordersLabel,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
              const SizedBox(height: 12),
              // Tab bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _selectedTab = 1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedTab == 1 ? const Color(0xFF03A9F4) : Colors.grey[200],
                          foregroundColor: _selectedTab == 1 ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(s.ordersCurrent, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _selectedTab = 0),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedTab == 0 ? const Color(0xFF03A9F4) : Colors.grey[200],
                          foregroundColor: _selectedTab == 0 ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(s.ordersArchive, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    final order = _orders[index];
                    final status = order['status'] as String;
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.orderDetails);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF03A9F4),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                                children: [
                                  Text(order['date'], style: const TextStyle(color: Colors.white, fontSize: 15)),
                                  Text(order['number'], style: const TextStyle(color: Colors.white, fontSize: 15)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                      children: [
                                        Text(order['items'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                        const SizedBox(height: 8),
                                        _buildStatusChip(status),
                                      ],
                                    ),
                                  ),
                                  if (status == s.statusReady) ...[
                                    Row(
                                      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                                      children: [
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundColor: const Color(0xFF03A9F4),
                                          child: IconButton(
                                            icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                                            onPressed: () {},
                                            tooltip: s.orderEdit,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundColor: const Color(0xFF03A9F4),
                                          child: IconButton(
                                            icon: const Icon(Icons.delete, color: Colors.white, size: 18),
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
            currentIndex: -1,
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