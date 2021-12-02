import 'package:flutter/material.dart';
import 'package:test_project/model/post/post.dart';
import 'package:test_project/widget/description.dart';

import '../widget/add_comments.dart';
import '../widget/all_comments.dart';
import '../widget/header_post.dart';
import '../widget/icon_under_image.dart';
import '../widget/likes.dart';
import '../widget/post_time.dart';

class PostScreen extends StatelessWidget {
  final Post post;
  final String username;

  const PostScreen({
    Key? key,
    required this.post,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Публикации',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderPost(urlProfile: post.imageUrlProfile, username: username),
          Image.network(post.imageUrlPost),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const IconUnderImage(),
                const SizedBox(height: 5),
                const Likes(),
                const SizedBox(height: 5),
                Description(
                  text: '${post.title} ${post.body}',
                  userName: username,
                ),
                const AllComments(),
                AddComment(urlProfile: post.imageUrlProfile),
                const PostTime(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
