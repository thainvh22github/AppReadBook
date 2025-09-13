import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/fake_data.dart';
import 'package:flutter_application_1/data/resource.dart';

class RankingList extends StatefulWidget {
  const RankingList({super.key});

  @override
  State<RankingList> createState() => _RankingListState();
}

/**
 * nvtduong
 * 11/09/25
 * bxh tháng
 */
class _RankingListState extends State<RankingList> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (RankingStories.length / 3).ceil();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalizationService.text("ranking_this_month"),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    LocalizationService.text("ranking_full"),
                    style: TextStyle(
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

        // Danh sách BXH từng trang
        Container(
          height: 320,
          child: PageView.builder(
            controller: _pageController,
            itemCount: totalPages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, columnIndex) {
              final startIndex = columnIndex * 3;
              final endIndex = (startIndex + 3 <= RankingStories.length)
                  ? startIndex + 3
                  : RankingStories.length;

              final group = RankingStories.sublist(startIndex, endIndex);

              return Column(
                children: group.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          //xếp hạng
                          Text(
                            item["rank"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 10),
                          // Ảnh
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              item["img"]!,
                              width: 60,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Nội dung
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"]!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
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
                                  item["author"]!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),

        // số trang
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalPages, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              width: _currentPage == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.white70
                    : Colors.grey.shade600,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
