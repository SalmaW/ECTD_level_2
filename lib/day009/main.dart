import 'package:ectd2/day009/bloc/comment/comment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post/posts_bloc.dart';
import 'pages/home.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(),
        ),
        BlocProvider<CommentBloc>(
          create: (BuildContext context) => CommentBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Bloc',
      home: const Home(),
    );
  }
}
