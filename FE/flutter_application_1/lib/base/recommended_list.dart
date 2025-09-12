import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/fake_data.dart';
import 'package:flutter_application_1/data/resource.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  final ScrollController _controller = ScrollController();
  final List<Map<String, String>> _items = []; //Danh sách dữ liệu đã load
  int _page = 0; //trang hiện tại
  final int _pageSize = 10; //Số truyện mỗi lần load
  bool _isLoading = false;
  bool _hasMore = true; //Cờ báo xem còn dữ liệu để load hay không

  @override
  void initState() {
    super.initState();
    _loadMore();
    _controller.addListener(_onScroll);
  }

  //Nếu vị trí cuộn gần chạm đáy (cách đáy 200px) → Gọi _loadMore() để tải thêm truyện.
  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return; //Chống spam
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 800));

    final start = _page * _pageSize;
    final end = start + _pageSize;
    if (start >= recommendedManga.length) {
      _hasMore = false;
    } else {
      _items.addAll(
        recommendedManga.sublist(
          start,
          end > recommendedManga.length ? recommendedManga.length : end,
        ),
      );
      _page++;
    }
    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalizationService.text("you_can_like"),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    LocalizationService.text("more"),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_right, color: Colors.grey, size: 18),
                ],
              ),
            ],
          ),
        ),
        ListView.separated(
          controller: _controller,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _items.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index < _items.length) {
              final item = _items[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['img']!,
                      height: MediaQuery.of(context).size.width * 0.2 * 1.25,
                      width: MediaQuery.of(context).size.width * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.visibility,
                              color: Colors.white70,
                              size: 18,
                            ),
                            Flexible(
                              child: Text(
                                " ${item["views"]}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          item['author']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Hot nhất No.${item['rank']!}",
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              if (_isLoading) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (!_hasMore) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      LocalizationService.text("all_shown"),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
