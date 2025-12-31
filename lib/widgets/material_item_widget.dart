import 'package:flutter/material.dart';

enum MaterialItemType { link, document, video }

class MaterialItemData {
  final String title;
  final MaterialItemType type;
  final bool isCompleted;

  MaterialItemData({
    required this.title,
    required this.type,
    required this.isCompleted,
  });

  IconData get icon {
    switch (type) {
      case MaterialItemType.link:
        return Icons.link;
      case MaterialItemType.document:
        return Icons.description;
      case MaterialItemType.video:
        return Icons.videocam;
    }
  }
}

class MaterialItemWidget extends StatelessWidget {
  final MaterialItemData item;
  final VoidCallback? onTap;

  const MaterialItemWidget({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 24,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(
                Icons.check_circle,
                color: item.isCompleted ? const Color(0xFF27AE60) : Colors.grey,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}