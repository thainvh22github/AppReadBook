import 'base/base_service.dart';

class HomeService  extends BaseService {

HomeService() : super(baseUrl: 'https://jsonplaceholder.typicode.com');

  Future<List<dynamic>> fetchPosts() async {
    return await get('/posts');
  }

  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    return await post('/posts', data);
  }
}
