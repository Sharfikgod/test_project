import 'dart:math' as math;

import 'package:flutter/material.dart';

class Likes extends StatelessWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberOfLikes = math.Random().nextInt(100);

    return Row(
      children: [
        const Text(
          'Нравится: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          numberOfLikes.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
