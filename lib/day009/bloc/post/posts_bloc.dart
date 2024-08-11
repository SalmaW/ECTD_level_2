import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/post_model.dart';
import '../../repository/posts_repo.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  late PostsRepo postsRepo;

  PostsBloc() : super(PostsLoading()) {
    postsRepo = PostsRepo();
    on<PostsEvent>(_onGetPosts);
  }

  FutureOr<void> _onGetPosts(PostsEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    var callResult = await postsRepo.get();

    if (callResult.isSuccess) {
      var posts = List<Post>.from(
          callResult.data.map((e) => Post.fromJson(e)).toList());
      emit(PostsLoaded(posts: posts));
    } else {
      emit(PostsError(errorMsg: callResult.error));
    }
  }
}
