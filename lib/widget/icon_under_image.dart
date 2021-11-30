import 'package:flutter/material.dart';

class IconUnderImage extends StatelessWidget {
  const IconUnderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.favorite_outline),
            const SizedBox(
              width: 15,
            ),
            Image.asset(
              'assets/chat.png',
              width: 22,
            ),
            const SizedBox(width: 18),
            Image.asset(
              'assets/send.png',
              width: 20,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: Image.asset(
            'assets/save.png',
            width: 20,
          ),
        ),
      ],
    );
  }
}
