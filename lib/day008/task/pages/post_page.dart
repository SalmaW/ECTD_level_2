import 'package:ectd2/day008/task/pages/post_details.dart';
import 'package:flutter/material.dart';

import '../services/dio_services.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Bloc'),
      ),
      body: FutureBuilder<List<dynamic>?>(
        future: DioService.getPostsDio(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts found'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final post = snapshot.data![index];
              return Card(
                child: ListTile(
                  title: Text(post['title'] ?? "no title"),
                  subtitle: Text(post["body"] ?? "no body"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetails(postId: post["id"]),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
