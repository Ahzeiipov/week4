import '../repository/post_repository.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpPostsRepository extends PostRepository {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<Post> getPost(int postId) async {
    final response = await http.get(Uri.parse('$url/$postId'));

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> data = json.decode(response.body);
        return Post.fromJson(data);
      } catch (e) {
        throw Exception('Failed to parse post data: $e');
      }
    } else {
      throw Exception(
          'Failed to fetch post (status code: ${response.statusCode})');
    }
  }
}
