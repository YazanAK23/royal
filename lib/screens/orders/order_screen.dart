import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedTab = 1;
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
    debugPrint('OrderScreen: _source argument is: \\$_source');
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: const Color(0xFF4CAF50),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.statusReady, style: TextStyle(color: Colors.white, fontSize: 15.sp)),
            SizedBox(width: 4.w),
            Icon(Icons.check_circle, color: Colors.white, size: 18.sp),
          ],
        ),
      );
    } else if (status == s.statusCancelled) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF44336),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.statusCancelled, style: TextStyle(color: Colors.white, fontSize: 15.sp)),
            SizedBox(width: 4.w),
            Icon(Icons.cancel, color: Colors.white, size: 18.sp),
          ],
        ),
      );
    } else if (status == s.statusPreparing) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: const Color(0xFF233A63),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.statusPreparing, style: TextStyle(color: Colors.white, fontSize: 15.sp)),
            SizedBox(width: 4.w),
            Icon(Icons.settings, color: Colors.white, size: 18.sp),
          ],
        ),
      );
    }
    return SizedBox(height: 0.h);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
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
              SizedBox(height: 12.h),
              // Title
              Text(
                s.ordersLabel,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
              SizedBox(height: 12.h),
              // Tab bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(s.ordersCurrent, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _selectedTab = 0),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedTab == 0 ? const Color(0xFF03A9F4) : Colors.grey[200],
                          foregroundColor: _selectedTab == 0 ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(s.ordersArchive, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    final order = _orders[index];
                    final status = order['status'] as String;
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.orderDetails);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          crossAxisAlignment: isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF03A9F4),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                                children: [
                                  Text(order['date'], style: TextStyle(color: Colors.white, fontSize: 15.sp)),
                                  Text(order['number'], style: TextStyle(color: Colors.white, fontSize: 15.sp)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                              child: Row(
                                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                      children: [
                                        if (isRTL) ...[
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Extract item count if present in the string (e.g., "كرسي ٨ صنف")
                                                Builder(
                                                  builder: (context) {
                                                    final itemsText = order['items'] as String;
                                                    final match = RegExp(r'(\d+\s*صنف)').firstMatch(itemsText);
                                                    String? count;
                                                    String? name;
                                                    if (match != null) {
                                                      count = match.group(0);
                                                      name = itemsText.replaceAll(match.group(0)!, '').trim();
                                                    } else {
                                                      name = itemsText;
                                                    }
                                                    return Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        if (count != null) ...[
                                                          Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                                                          SizedBox(width: 6.w),
                                                        ],
                                                        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: _buildStatusChip(status),
                                          ),
                                        ] else ...[
                                          // For LTR, keep as before
                                          Text(order['items'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                                          SizedBox(height: 8.h),
                                          _buildStatusChip(status),
                                        ],
                                      ],
                                    ),
                                  ),
                                  if (status == s.statusReady) ...[
                                    Row(
                                      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                                      children: [
                                        CircleAvatar(
                                          radius: 18.r,
                                          backgroundColor: const Color(0xFF03A9F4),
                                          child: IconButton(
                                            icon: Icon(Icons.edit, color: Colors.white, size: 18.sp),
                                            onPressed: () {},
                                            tooltip: s.orderEdit,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        CircleAvatar(
                                          radius: 18.r,
                                          backgroundColor: const Color(0xFF03A9F4),
                                          child: IconButton(
                                            icon: Icon(Icons.delete, color: Colors.white, size: 18.sp),
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