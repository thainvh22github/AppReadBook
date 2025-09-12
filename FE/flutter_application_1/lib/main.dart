import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/bottom_nav.dart';
import 'base/search_bar.dart';
import 'base/hot_manga.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/base/ranking_list.dart';
import 'package:flutter_application_1/base/recommended_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // tranh bi che boi status bar
        child: Column(
          children: [
            // Thanh search cố định
            searchBar(),

            // Phần nội dung cuộn
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HotManga(),
                    RankingList(),
                    SizedBox(height: 20),
                    RecommendedList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
