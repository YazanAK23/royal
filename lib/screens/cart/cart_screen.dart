import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/widgets/custom_app_bar.dart';
import 'package:royal/widgets/custom_bottom_nav_bar.dart';
import 'package:royal/widgets/item_card.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/core/constants/app_colors.dart';
import 'package:royal/core/constants/app_text_styles.dart';
import 'package:royal/core/constants/app_dimensions.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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
      backgroundColor: AppColors.cartBackground,
      appBar: CustomAppBar(
        onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.cartTitlePaddingTop.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  s.cartLabel,
                  style: AppTextStyles.cartTitle.copyWith(fontSize: 20.sp),
                ),
              ),
            ),
            Positioned(
              top: AppDimensions.cartBackButtonPaddingTop.h,
              left: AppDimensions.cartBackButtonPaddingLeft.w,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20.sp, color: AppColors.cartBackButton),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.cartContentPaddingTop.h),
              child: Column(
                children: [
                  SizedBox(height: AppDimensions.cartSpacingSmall.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: AppDimensions.cartButtonPaddingHorizontal.w),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.cartButtonPaddingHorizontal.w,
                      vertical: AppDimensions.cartButtonPaddingVertical.h,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: AppDimensions.cartButtonHeight.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.cartButtonBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimensions.cartButtonBorderRadius.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          s.completeOrderButton,
                          style: AppTextStyles.cartButtonText.copyWith(fontSize: 16.sp),
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
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.favorite);
          } else if (index == 2) {
            // Already on cart
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.history);
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.info);
          }
        },
      ),
    );
  }
}
