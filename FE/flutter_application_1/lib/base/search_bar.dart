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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(202, 0, 0, 0),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  255,
                  0,
                  0,
                  0,
                ).withOpacity(0.5), // mau bong
                spreadRadius: 1, //do lan bong
                blurRadius: 6, // do mo
                offset: const Offset(0, 3), // ngang - doc
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Tim kiem...",
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 239, 239, 239),
                fontSize: 14,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 239, 239, 239),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.leaderboard,
              color: Color.fromARGB(255, 239, 239, 239),
            ),
            onPressed: () {
              print("Thong bao");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.grid_view,
              color: Color.fromARGB(255, 239, 239, 239),
            ),
            onPressed: () {
              print("Thong bao");
            },
          ),
        ],
      ),
      body: const Center(child: Text("Noi dung chinh")),
    );
  }
}
