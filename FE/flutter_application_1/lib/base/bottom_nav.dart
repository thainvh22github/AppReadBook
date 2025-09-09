import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // trang chủ
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: const Color(0xFFC2C2C2)),
                onPressed: () {
                  // xu ly chuyen trang
                },
              ),
              const Text(
                "Trang chủ",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          // Phân loại
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.layers, color: Colors.white70),
                onPressed: () {
                  // xu ly chuyen trang
                },
              ),
              const Text(
                "Phân loại",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),

          // Theo dõi
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.person_add, color: Colors.white70),
                onPressed: () {
                  // xu ly chuyen trang
                },
              ),
              const Text(
                "Theo dõi",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          //Tủ sách
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.bookmark, color: Colors.white70),
                onPressed: () {
                  // xu ly chuyen trang
                },
              ),
              const Text(
                "Tủ sách",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),

          //Tôi
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.mood, color: Colors.white70),
                onPressed: () {
                  // xu ly chuyen trang
                },
              ),
              const Text(
                "Tôi",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
