import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post/posts_bloc.dart';
import 'post_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<PostsBloc>().add(PostsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Bloc'),
      ),
      body: Center(
        child: BlocBuilder<PostsBloc, PostsState>(
          // buildWhen: (previous, current) => current is! EmployeeAddedState,
          builder: (context, state) {
            if (state is PostsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PostsLoaded) {
              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  surfaceTintColor: Colors.amberAccent,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PostDetails(post: state.posts[index])));
                    },
                    title: Text(state.posts[index].title ?? "no title"),
                    subtitle: Text(state.posts[index].body ?? "no title"),
                  ),
                );
              });
            }

            if (state is PostsError) {
              return Center(child: Text("Post Error ${state.errorMsg}"));
            }

            return Text("block $state");
          },
        ),
      ),
    );
  }
}
