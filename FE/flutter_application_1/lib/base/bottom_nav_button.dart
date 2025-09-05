import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final String text;
  final Icon imagePath;
  final VoidCallback onTap;

  const BottomNavButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imagePath,
          const SizedBox(height: 4),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
