import 'package:flutter_application_1/models/hot_manga_stories.dart';

import 'base/base_service.dart';

class HomeService extends BaseService {
  HomeService() : super(baseUrl: 'https://localhost:7231/Home');

  Future<List<HotMangaStories>> getHotmanga() async {
    var item = await get('/all');
    List<HotMangaStories> result = (item as List)
        .map((json) => HotMangaStories.fromJson(json))
        .toList();
    return result;
  }

  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    return await post('/posts', data);
  }
}
