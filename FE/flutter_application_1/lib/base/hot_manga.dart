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
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  final double _itemWidth = 120; //chieu rong item
  Timer? _timer;

  bool _isAutoScrolling = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        _isAutoScrolling = true; // bật cờ
        setState(() {
          _currentPage++;
          if (_currentPage >= HotMangaStories.length) {
            // reset về đầu
            _scrollController.jumpTo(0);
            _currentPage = 0;
          }
        });

        _scrollController
            .animateTo(
              _currentPage * (_itemWidth),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            )
            .whenComplete(() {
              _isAutoScrolling = false; // tắt cờ khi animation xong
            });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _pauseAutoScroll() {
    _timer?.cancel();
    // Sau 2 giây không vuốt thì chạy lại
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) _startAutoScroll();
    });
  }

  void _updateCurrentPage() {
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      int index = (offset / _itemWidth).round();
      if (index != _currentPage) {
        setState(() {
          _currentPage = index.clamp(0, HotMangaStories.length - 1);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Không thể bỏ lỡ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Hot nhất >",
                style: TextStyle(
                  color: Color.fromARGB(255, 194, 194, 194),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        // List truyen
        Container(
          height: 260,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (!_isAutoScrolling) {
                if (scroll is ScrollUpdateNotification ||
                    scroll is ScrollEndNotification) {
                  _pauseAutoScroll(); // dừng auto khi vuốt
                  double offset = _scrollController.offset;
                  int index = (offset / _itemWidth).round();
                  index = index.clamp(0, HotMangaStories.length - 1);

                  if (index != _currentPage) {
                    setState(() {
                      _currentPage = index;
                    });
                  }
                }
              }
              return true;
            },

            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: HotMangaStories.length,
              padding: const EdgeInsets.only(left: 16),

              itemBuilder: (context, index) {
                final story = HotMangaStories[index];
                bool isActive = index == _currentPage;

                return AnimatedContainer(
                  duration: const Duration(microseconds: 400),
                  width: 120,

                  margin: EdgeInsets.symmetric(
                    horizontal: isActive ? 6 : 0,
                    vertical: isActive ? 20 : 25,
                  ), // item dc chon -> margin trai/phai = 12

                  child: Transform.scale(
                    scale: isActive ? 1.1 : 0.9,
                    child: AnimatedOpacity(
                      opacity: isActive ? 1.0 : 0.6,
                      duration: const Duration(milliseconds: 400),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ảnh
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: isActive
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.3),
                                  blurRadius: isActive ? 8 : 4,
                                  spreadRadius: isActive ? 4 : 1,
                                ),
                              ],
                            ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                story.image,
                                width: _itemWidth - 20,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),

                          //tieu de
                          Container(
                            width: _itemWidth,

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

                          // the loai
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
