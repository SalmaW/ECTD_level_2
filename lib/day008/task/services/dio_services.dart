import 'package:dio/dio.dart';

abstract class DioService {
  static final _baseOptions =
      BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/");
  static final Dio dio = Dio(_baseOptions);

  static Future<List<dynamic>?> getPostsDio() async {
    try {
      var postData = await dio.get('posts');
      if (postData.statusCode == 200) return postData.data;
    } catch (e) {
      rethrow;
    }
    return [];
  }

  static Future<Map<String, dynamic>?> getPostDio(int id) async {
    try {
      var postData = await dio.get('posts/$id');
      if (postData.statusCode == 200) return postData.data;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  static Future<List<dynamic>?> getCommentsDio(int postId) async {
    try {
      var postComments = await dio.get('posts/$postId/comments');
      if (postComments.statusCode == 200) return postComments.data;
    } catch (e) {
      rethrow;
    }
    return [];
  }
}
