import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/bottom_nav.dart';
// import file widget base
import 'base/search_bar.dart'; // import file widget base
import 'base/hot_manga.dart';// import file service
import 'package:google_fonts/google_fonts.dart';

late Future<List<dynamic>> posts;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Áp dụng Roboto cho toàn bộ text
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
      body: Container(
        child: Column(children: [searchBar(), HotManga()]),
        color: Colors.black,
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
