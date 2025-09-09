import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/fake_data.dart';
import 'dart:async';

class HotManga extends StatefulWidget {
  const HotManga({super.key});

  @override
  State<HotManga> createState() => _HotMangaState();
}
/**
 * ndtduong
 * 07/09/25
 * tao list truyen hott
 */

class _HotMangaState extends State<HotManga> {
  final PageController _pageController = PageController(viewportFraction: 0.25);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage++;
          if (_currentPage >= HotMangaStories.length) {
            _currentPage = 0;
            _pageController.jumpToPage(0);
          } else {
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _pauseAutoScroll() {
    _timer?.cancel();
    // sau 1s ko vuốt thì chạy tiếp
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Không thể bỏ lỡ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Hot nhất",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4), // cách chữ với icon 1 chút
                  const Icon(
                    Icons.arrow_right,
                    color: Color.fromARGB(255, 194, 194, 194),
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),

        // PageView
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Container(
            height: MediaQuery.of(context).size.width * 0.5 * 1.25,
            margin: EdgeInsets.only(left: 10),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                _pauseAutoScroll();
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: HotMangaStories.length,
              padEnds: false,
              itemBuilder: (context, index) {
                final story = HotMangaStories[index];
                bool isActive = index == _currentPage;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: EdgeInsets.symmetric(
                    horizontal: isActive ? 4 : 8,
                    vertical: isActive ? 10 : 15,
                  ),

                  child: AnimatedOpacity(
                    opacity: isActive ? 1.0 : 0.6,
                    duration: const Duration(milliseconds: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ảnh
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            boxShadow: [
                              BoxShadow(
                                color: isActive
                                    ? Colors.white.withOpacity(0.8)
                                    : const Color(0xFFFFFFFF).withOpacity(0.3),
                                blurRadius: isActive ? 4 : 1,
                                spreadRadius: isActive ? 4 : 1,
                              ),
                            ],
                          ),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              story.image,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height:
                                  MediaQuery.of(context).size.width *
                                  0.25 *
                                  1.25, // giữ tỉ lệ 1.25
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Tiêu đề
                        Container(
                          width: 120,
                          child: Text(
                            story.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        // Thể loại
                        Wrap(
                          spacing: 4,
                          runSpacing: -4,
                          children: story.categories
                              .map(
                                (cat) => Text(
                                  cat,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 194, 194, 194),
                                    fontSize: 12,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
