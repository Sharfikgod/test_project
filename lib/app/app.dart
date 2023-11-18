import 'package:flutter/material.dart';
import 'package:test_project/pages/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MainPage(),
    );
  }
}
