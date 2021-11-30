import 'package:flutter/material.dart';

class Likes extends StatelessWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Нравится: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '30',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
