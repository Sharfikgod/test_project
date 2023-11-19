import 'package:flutter/material.dart';
import 'package:test_project/extensions/nav_context_ext.dart';
import 'package:test_project/pages/contact_us/contact_us_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/mainPage';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => context.pushNamed(ContactUsPage.routeName),
          child: const Text('Contact us'),
        ),
      ),
    );
  }
}
