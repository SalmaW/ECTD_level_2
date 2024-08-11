import 'package:ectd2/day009/bloc/comment/comment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';

class PostDetails extends StatefulWidget {
  final Post post;

  const PostDetails({required this.post, super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  bool isExpanded = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    context
        .read<CommentBloc>()
        .add(CommentInitialEvent(postId: widget.post.id!));
    if (isExpanded) {
      isExpanded = false;
      setState(() {});
    }
    await Future.delayed(const Duration(seconds: 2));
    isExpanded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.id.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedContainer(
              height: isExpanded ? 250 : 0,
              duration: const Duration(microseconds: 600),
              child: SingleChildScrollView(
                child: PhysicalModel(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(15),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.title ?? "no title",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          widget.post.body ?? "no body",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Comments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Icon(Icons.comment),
                const SizedBox(width: 8.0),
                Text(
                  'Author: ${widget.post.userId}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<CommentBloc, CommentState>(
                // buildWhen: (previous, current) => current is! EmployeeAddedState,
                builder: (context, state) {
                  if (state is CommentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CommentLoaded) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Card(
                        surfaceTintColor: Colors.amberAccent,
                        child: ListTile(
                          title:
                              Text(state.comments[index].email ?? "no email"),
                          subtitle:
                              Text(state.comments[index].body ?? "no title"),
                        ),
                      );
                    });
                  }

                  if (state is CommentError) {
                    return Center(child: Text("Post Error ${state.errorMsg}"));
                  }

                  return Text("block $state");
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the edit post screen with the post data
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => EditPost(post: widget.post),
          //   ),
          // );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
