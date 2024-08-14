import 'package:ectd2/day008/task/model/post_model.dart';

import '../services/dio_services.dart';

class PostRepo {
  final DioService dioService;

  PostRepo(this.dioService);

  Future<List<Post>?> getPostsDio() async {
    final posts = await DioService.getPostsDio();
    return posts?.map((e) => Post.fromJson(e)).toList();
  }
}
