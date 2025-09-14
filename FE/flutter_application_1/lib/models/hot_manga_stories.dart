import 'dart:convert';

/// HotMangaStories
///
/// Tương ứng với C#:
/// [Key] public Guid pk_id { get; set; }
/// public string title { get; set; }
/// public List<string> categories { get; set; }
/// public string image { get; set; }
class HotMangaStories {
  final String pkId; // Guid từ BE sẽ về dạng String
  final String title;
  final List<String> categories;
  final String image;

  HotMangaStories({
    required this.pkId,
    required this.title,
    required this.categories,
    required this.image,
  });

  /// Parse JSON -> HotMangaStories
  factory HotMangaStories.fromJson(Map<String, dynamic> json) {
    return HotMangaStories(
      pkId: json['pk_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      categories:
          (json['categories'] as List?)?.map((e) => e.toString()).toList() ??
          [],
      image: json['image']?.toString() ?? '',
    );
  }

  /// HotMangaStories -> JSON
  Map<String, dynamic> toJson() {
    return {
      'pk_id': pkId,
      'title': title,
      'categories': categories,
      'image': image,
    };
  }

  /// Tiện dụng: chuyển list object -> list json
  static List<HotMangaStories> listFromJson(String jsonStr) {
    final List<dynamic> data = json.decode(jsonStr);
    return data.map((e) => HotMangaStories.fromJson(e)).toList();
  }
}
