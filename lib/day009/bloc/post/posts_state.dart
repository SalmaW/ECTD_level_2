part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsLoading extends PostsState {}

final class PostsLoaded extends PostsState {
  List<Post> posts;

  PostsLoaded({required this.posts});
}

final class PostsError extends PostsState {
  final String errorMsg;

  PostsError({required this.errorMsg});
}
