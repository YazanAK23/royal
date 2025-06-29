import 'package:flutter/material.dart';
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
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  code,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _CircleButton(icon: Icons.add, onTap: onAdd),
                    const SizedBox(width: 8),
                    Text('$quantity', style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    _CircleButton(icon: Icons.remove, onTap: onRemove),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: unit,
                      items: [
                        DropdownMenuItem(
                          value: s.itemKitchenSinkUnitCTN,
                          child: Text(s.itemKitchenSinkUnitCTN),
                        ),
                        DropdownMenuItem(
                          value: s.itemKitchenSinkUnitPACK,
                          child: Text(s.itemKitchenSinkUnitPACK),
                        ),
                      ],
                      onChanged: onUnitChanged,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  unitDetails,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          // Delete button
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: onDelete,
            style: IconButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
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

  const _CircleButton({required this.icon, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
