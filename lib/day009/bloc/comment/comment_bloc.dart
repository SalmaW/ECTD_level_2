import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/comment_model.dart';
import '../../repository/comments_repo.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  late CommentsRepo commentsRepo;

  CommentBloc() : super(CommentLoading()) {
    commentsRepo = CommentsRepo();
    on<CommentInitialEvent>(_onGetComment);
  }

  FutureOr<void> _onGetComment(
      CommentInitialEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    var callResult = await commentsRepo.get({"postId": event.postId});

    if (callResult.isSuccess) {
      var posts = List<Comment>.from(
          callResult.data.map((e) => Comment.fromJson(e)).toList());
      emit(CommentLoaded(comments: posts));
    } else {
      emit(CommentError(errorMsg: callResult.error));
    }
  }
}
