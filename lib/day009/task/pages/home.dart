import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/posts_provider.dart';
import 'post_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Initialize the posts when the Home widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsProvider>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Provider'),
      ),
      body: Center(
        child: Consumer<PostsProvider>(
          builder: (context, postsProvider, child) {
            if (postsProvider.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (postsProvider.error != null) {
              return Center(child: Text("Post Error: ${postsProvider.error}"));
            }

            return ListView.builder(
              itemCount: postsProvider.posts.length,
              itemBuilder: (context, index) {
                return Card(
                  surfaceTintColor: Colors.amberAccent,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PostDetails(post: postsProvider.posts[index]),
                        ),
                      );
                    },
                    title: Text(postsProvider.posts[index].title ?? "no title"),
                    subtitle:
                        Text(postsProvider.posts[index].body ?? "no title"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
