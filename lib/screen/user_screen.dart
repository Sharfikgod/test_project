import 'package:flutter/material.dart';
import 'package:test_project/widget/list_view_builder.dart';

import '/model/user/user.dart';
import '/factory/user_factory.dart';
import '../helper/something_wrong_exception.dart';
import 'posts_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserFactory userFactory = UserFactory();
  bool isLoading = false;
  List<User> listUser = [];

  void fetchUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      listUser = await userFactory.getUsers();
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextButton(
              child: const Text('Get users'),
              onPressed: () => setState(() {
                fetchUser();
              }),
            ),
            Expanded(
              child: !isLoading
                  ? ListViewBuilder(
                      listData: listUser,
                      listTileFun: (context, i) {
                        return ListTile(
                            title: Text(listUser[i].name),
                            subtitle: Text(listUser[i].address.city),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => PostsScreen(
                                    user: listUser[i],
                                  ),
                                ),
                              );
                            });
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
