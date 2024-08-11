import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/post_model.dart';

class PostsService {
  static Future<List<Post>> fetchPosts() async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts'); // Example API endpoint
    final response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode < 299) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
