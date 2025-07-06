import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/core/models/product_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';

class ProductItemList extends StatelessWidget {
  final String title;
  final List<ProductItem> items;
  final VoidCallback? onBack;
  final void Function(ProductItem)? onFavoriteToggle;
  final void Function(ProductItem)? onItemTap;

  const ProductItemList({
    super.key,
    required this.title,
    required this.items,
    this.onBack,
    this.onFavoriteToggle,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 28.sp),
                onPressed: onBack ?? () => Navigator.pop(context),
                splashRadius: 22.r,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.only(right: 32.w, left: 24.w),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(height: 8.h),
            itemBuilder: (context, index) {
              final product = items[index];
              return GestureDetector(
                onTap: () => onItemTap?.call(product),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(8),
                          blurRadius: 2.r,
                          offset: Offset(0, 1.h),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 54.w,
                              height: 54.h,
                              margin: EdgeInsets.only(right: 12.w, left: 8.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: product.image != null
                                  ? Padding(
                                      padding: EdgeInsets.all(6.w),
                                      child: product.image!.endsWith('.svg')
                                          ? SvgPicture.asset(product.image!, fit: BoxFit.contain)
                                          : Image.asset(product.image!, fit: BoxFit.contain),
                                    )
                                  : null,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Text(
                                  product.title,
                                  style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            IconButton(
                              onPressed: () => onFavoriteToggle?.call(product),
                              icon: Icon(
                                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: product.isFavorite ? const Color.fromARGB(255, 0, 159, 227) : Colors.grey,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.arrow_forward_ios, color: const Color(0xFF009FE3), size: 22.sp),
                            SizedBox(width: 8.w),
                          ],
                        ),
                        if (index != items.length - 1)
                          Positioned(
                            left: 12.w,
                            right: 12.w,
                            bottom: 0.h,
                            child: Divider(
                              height: 1.h,
                              thickness: 1.h,
                              color: const Color(0x00e8e8e8),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
