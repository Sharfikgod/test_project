import 'package:flutter/material.dart';

class HeaderPost extends StatelessWidget {
  final String urlProfile;
  final String username;

  const HeaderPost({
    Key? key,
    required this.urlProfile,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(urlProfile),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Havaji',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            child: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
