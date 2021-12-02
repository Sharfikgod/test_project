import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String text;
  final String userName;

  const Description({
    Key? key,
    required this.text,
    required this.userName,
  }) : super(key: key);

  @override
  DescriptionState createState() => DescriptionState();
}

class DescriptionState extends State<Description> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            widget.text,
            overflow: !isExpanded ? TextOverflow.ellipsis : TextOverflow.visible,
          ),
        ),
        if (!isExpanded)
          TextButton(
            clipBehavior: Clip.none,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              alignment: Alignment.topLeft,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              setState(() {
                isExpanded = true;
              });
            },
            child: const Text(
              'ещё',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )
      ],
    );
  }
}
