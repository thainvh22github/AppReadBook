import 'package:flutter/material.dart';
import 'base/bottom_nav_button.dart'; // import file widget base

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Nội dung chính")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavButton(
              text: "Trang chủ 1",
              imagePath: Icon(Icons.home_outlined), // hình trong assets
              onTap: () {
                print("Trang chủ");
              },
            ),
            BottomNavButton(
              text: "Danh mục",
              imagePath: Icon(Icons.home_outlined),
              onTap: () {
                print("Danh mục");
              },
            ),
          ],
        ),
      ),
    );
  }
}
