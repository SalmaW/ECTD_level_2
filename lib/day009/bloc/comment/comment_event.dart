part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentInitialEvent extends CommentEvent {
  final int postId;

  CommentInitialEvent({required this.postId});
}
