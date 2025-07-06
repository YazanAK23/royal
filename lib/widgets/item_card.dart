import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/generated/l10n.dart';

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String code;
  final int quantity;
  final String unit;
  final String unitDetails;
  final VoidCallback onDelete;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final ValueChanged<String?> onUnitChanged;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.code,
    required this.quantity,
    required this.unit,
    required this.unitDetails,
    required this.onDelete,
    required this.onAdd,
    required this.onRemove,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imagePath,
              width: 80.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16.sp, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  code,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    _CircleButton(icon: Icons.add, onTap: onAdd),
                    SizedBox(width: 8.w),
                    Text('$quantity', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(width: 8.w),
                    _CircleButton(icon: Icons.remove, onTap: onRemove),
                    SizedBox(width: 12.w),
                    DropdownButton<String>(
                      value: unit,
                      items: [
                        DropdownMenuItem(
                          value: s.itemKitchenSinkUnitCTN,
                          child: Text(s.itemKitchenSinkUnitCTN, style: TextStyle(fontSize: 12.sp)),
                        ),
                        DropdownMenuItem(
                          value: s.itemKitchenSinkUnitPACK,
                          child: Text(s.itemKitchenSinkUnitPACK, style: TextStyle(fontSize: 12.sp)),
                        ),
                      ],
                      onChanged: onUnitChanged,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  unitDetails,
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          // Delete button
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white, size: 24.sp),
            onPressed: onDelete,
            style: IconButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
              padding: EdgeInsets.all(8.w),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: Icon(icon, size: 18.sp),
      ),
    );
  }
}
