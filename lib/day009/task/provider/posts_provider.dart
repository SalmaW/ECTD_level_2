import 'package:flutter/material.dart';

import '../../model/post_model.dart';
import '../services/posts_services.dart'; // Assuming you have a service to fetch posts

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _loading = false;
  String? _error;

  List<Post> get posts => _posts;

  bool get loading => _loading;

  String? get error => _error;

  Future<void> fetchPosts() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _posts = await PostsService.fetchPosts(); // Fetch posts from your service
      _loading = false;
    } catch (e) {
      _error = e.toString();
      _loading = false;
    }

    notifyListeners();
  }
}
