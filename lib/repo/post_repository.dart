import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostRepository {
  Future<Post> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/posts'),
    );

    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}