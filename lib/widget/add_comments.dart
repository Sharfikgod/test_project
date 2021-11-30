import 'package:flutter/material.dart';

class AddComment extends StatelessWidget {
  final String urlProfile;
  const AddComment({
    Key? key,
    required this.urlProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(urlProfile),
          maxRadius: 14,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'Add a comment...',
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
