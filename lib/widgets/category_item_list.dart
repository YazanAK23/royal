import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        const SizedBox(height: 24),
        // Back button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF009FE3), size: 28),
                onPressed: onBack ?? () => Navigator.pop(context),
                splashRadius: 22,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Right-aligned Category Title
        Padding(
          padding: const EdgeInsets.only(right: 32, left: 24),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF009FE3),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        const SizedBox(height: 28),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
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
                              width: 54,
                              height: 54,
                              margin: const EdgeInsets.only(right: 12, left: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: item.icon != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(6.0),
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
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  item.title,
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Arrow (left)
                            const Icon(Icons.arrow_forward_ios, color: Color(0xFF009FE3), size: 22),
                            const SizedBox(width: 8),
                          ],
                        ),
                        // Divider at the bottom
                        if (index != items.length - 1)
                          const Positioned(
                            left: 12,
                            right: 12,
                            bottom: 0,
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xe8e8e8),
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
