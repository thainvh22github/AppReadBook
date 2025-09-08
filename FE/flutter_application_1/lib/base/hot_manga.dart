import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/fake_data.dart';

class HotManga extends StatelessWidget {
  const HotManga({super.key});

  /**
 * ndtduong
 * 07/09/25
 * tao list truyen hot
 */
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Khong the bo lo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Hot nhat >",
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
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HotMangaStories.length,
            itemBuilder: (context, index) {
              final story = HotMangaStories[index];
              return Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // anh
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            blurRadius: 2,
                            //
                          ),
                        ],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          story.image,
                          width: 100,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    //tieu de
                    Text(
                      story.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
