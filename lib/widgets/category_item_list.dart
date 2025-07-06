import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem {
  final String title;
  final String? icon;
  CategoryItem({required this.title, this.icon});
}

class CategoryItemList extends StatelessWidget {
  final String title;
  final List<CategoryItem> items;
  final VoidCallback? onBack;
  final void Function(CategoryItem)? onItemTap;

  const CategoryItemList({
    super.key,
    required this.title,
    required this.items,
    this.onBack,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        // Back button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: const Color(0xFF009FE3), size: 28.sp),
                onPressed: onBack ?? () => Navigator.pop(context),
                splashRadius: 22,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        // Right-aligned Category Title
        Padding(
          padding: EdgeInsets.only(right: 32.w, left: 24.w),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF009FE3),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        SizedBox(height: 28.h),
        // Category Items List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () => onItemTap?.call(item),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(8), // 0.03 * 255 ≈ 8
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
                            // Image or placeholder (right)
                            Container(
                              width: 54.w,
                              height: 54.h,
                              margin: EdgeInsets.only(right: 12.w, left: 8.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: item.icon != null
                                  ? Padding(
                                      padding: EdgeInsets.all(6.r),
                                      child: item.icon!.endsWith('.svg')
                                          ? SvgPicture.asset(
                                              item.icon!,
                                              fit: BoxFit.contain,
                                            )
                                          : Image.asset(
                                              item.icon!,
                                              fit: BoxFit.contain,
                                            ),
                                    )
                                  : null,
                            ),
                            // Title (expanded, right-aligned)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Text(
                                  item.title,
                                  style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            // Arrow (left)
                            Icon(Icons.arrow_forward_ios, color: const Color(0xFF009FE3), size: 22.sp),
                            SizedBox(width: 8.w),
                          ],
                        ),
                        // Divider at the bottom
                        if (index != items.length - 1)
                          Positioned(
                            left: 12.w,
                            right: 12.w,
                            bottom: 0,
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
