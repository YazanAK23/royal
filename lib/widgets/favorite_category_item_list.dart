import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCategoryItem {
  final String title;
  final String? icon;
  final bool isFavorite;
  FavoriteCategoryItem({required this.title, this.icon, this.isFavorite = false});
}

class FavoriteCategoryItemList extends StatelessWidget {
  final String title;
  final List<FavoriteCategoryItem> items;
  final void Function(FavoriteCategoryItem)? onItemTap;

  const FavoriteCategoryItemList({
    super.key,
    required this.title,
    required this.items,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
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
        Expanded(
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
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
                          color: Colors.black.withAlpha(8),
                          blurRadius: 2.r,
                          offset: Offset(0, 1.h),
                        ),
                      ],
                    ),
                    child: Row(
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
                                  padding: EdgeInsets.all(6.w),
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
                        // Favorite icon
                        Icon(
                          item.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: item.isFavorite ? const Color(0xFF009FE3) : Colors.grey,
                          size: 22.sp,
                        ),
                        SizedBox(width: 8.w),
                        // Arrow (left)
                        Icon(Icons.arrow_forward_ios, color: const Color(0xFF009FE3), size: 22.sp),
                        SizedBox(width: 8.w),
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
