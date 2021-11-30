import 'package:flutter/material.dart';

class PostTime extends StatelessWidget {
  const PostTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '9 июня 2020 г.',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 10,
      ),
    );
  }
}
