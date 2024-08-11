part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentLoading extends CommentState {}

final class CommentLoaded extends CommentState {
  List<Comment> comments;

  CommentLoaded({required this.comments});
}

final class CommentError extends CommentState {
  final String errorMsg;

  CommentError({required this.errorMsg});
}
