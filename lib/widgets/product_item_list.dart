import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/core/models/product_item.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_dimensions.dart';

class ProductItemList extends StatelessWidget {
  final String title;
  final List<ProductItem> items;
  final VoidCallback? onBack;
  final void Function(ProductItem)? onFavoriteToggle;

  const ProductItemList({
    super.key,
    required this.title,
    required this.items,
    this.onBack,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 28),
                onPressed: onBack ?? () => Navigator.pop(context),
                splashRadius: 22,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(right: 32, left: 24),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final product = items[index];
              return Padding(
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
                            child: product.image != null
                                ? Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: product.image!.endsWith('.svg')
                                        ? SvgPicture.asset(product.image!, fit: BoxFit.contain)
                                        : Image.asset(product.image!, fit: BoxFit.contain),
                                  )
                                : null,
                          ),
                          // Title (expanded, right-aligned)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                product.title,
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Favorite button (left)
                          IconButton(
                            onPressed: () => onFavoriteToggle?.call(product),
                            icon: Icon(
                              product.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: product.isFavorite ? const Color.fromARGB(255, 0, 159, 227) : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Arrow icon (left of favorite)
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
                            color:  Color(0xe8e8e8),
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
    );
  }
}
