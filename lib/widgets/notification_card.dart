import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final String? icon;
  final String? image;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.date,
    this.icon,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    // Directionality is now handled by Flutter's localization system (MaterialApp/CupertinoApp)
    // No need to check or use isRtl; just build the widget tree and Flutter will handle direction automatically.
    final Widget mediaWidget = icon != null
        ? Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Image.asset(icon!, width: 32.w, height: 32.h),
            ),
          )
        : image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(image!, width: 48.w, height: 48.h, fit: BoxFit.cover),
              )
            : const SizedBox.shrink();

    final textColumn = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            message,
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
          ),
          SizedBox(height: 8.h),
          Text(
            date,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(13), // 0.05 * 255 ≈ 13
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [mediaWidget, SizedBox(width: 12.w), textColumn],
      ),
    );
  }
}
