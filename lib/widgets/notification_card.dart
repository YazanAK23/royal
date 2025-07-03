import 'package:flutter/material.dart';

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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(icon!, width: 32, height: 32),
            ),
          )
        : image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image!, width: 48, height: 48, fit: BoxFit.cover),
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
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            message,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(13), // 0.05 * 255 ≈ 13
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [mediaWidget, const SizedBox(width: 12), textColumn],
      ),
    );
  }
}
