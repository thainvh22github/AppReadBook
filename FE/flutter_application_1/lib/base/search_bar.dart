import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  /**
   * nvtduong
   * 6/9/25
   * thanh tim kiem
   */
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
        color: const Color(0xFF242424), // nền ngoài cùng

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // thanh tìm kiếm
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  style: const TextStyle(color: Colors.white60),
                  decoration: const InputDecoration(
                    hintText: "Tìm kiếm...",

                    hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.leaderboard, color: Colors.white70),
                  onPressed: () {
                    print("Leaderboard");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.grid_view, color: Colors.white70),
                  onPressed: () {
                    print("Grid view");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
