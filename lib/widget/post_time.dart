import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostTime extends StatelessWidget {
  const PostTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var randomInt = math.Random().nextInt(12);
    final DateTime now = DateTime(2021, randomInt, randomInt, randomInt);
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    final String formatted = formatter.format(now);

    return Text(
      formatted,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 10,
      ),
    );
  }
}
