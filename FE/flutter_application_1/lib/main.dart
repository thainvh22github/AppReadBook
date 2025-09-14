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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  // Khóa để gọi hàm loadMore() trong RecommendedList từ ngoài
  final GlobalKey<RecommendedListState> _recommendedKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        // 🔥 Gọi loadMore trong RecommendedList
        _recommendedKey.currentState?.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar cố định
            searchBar(),

            // Nội dung cuộn
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const SliverToBoxAdapter(child: HotManga()),
                  const SliverToBoxAdapter(child: RankingList()),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverToBoxAdapter(
                    child: RecommendedList(key: _recommendedKey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
