import 'package:flutter/material.dart';

import '/helper/something_wrong_exception.dart';
import '/model/post.dart';
import '/model/user.dart';
import '/screen/post_screen.dart';
import '../factory/post_factory.dart';

class PostsScreen extends StatefulWidget {
  final User user;
  const PostsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  PostFactory postFactory = PostFactory();

  bool isLoading = false;
  List<Post> listPost = [];

  @override
  void initState() {
    fetchPost(widget.user.id);
    super.initState();
  }

  void fetchPost(int id) async {
    setState(() {
      isLoading = true;
    });
    try {
      listPost = await postFactory.getPosts(id);
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(SomethingWrongException().toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: !isLoading
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listPost.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Image.network(listPost[i].imageUrlPost),
                    title: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        listPost[i].title,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PostScreen(
                          post: listPost[i],
                          username: widget.user.username,
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
