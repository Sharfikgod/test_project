import 'package:flutter/material.dart';
import 'package:test_project/pages/contact_us/contact_us_page.dart';
import 'package:test_project/pages/main_page.dart';

final _navigationKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigationKey,
      initialRoute: MainPage.routeName,
      theme: ThemeData(),
      home: const MainPage(),
      routes: {
        MainPage.routeName: (context) => const MainPage(),
        ContactUsPage.routeName: (context) => const ContactUsPage(),
      },
    );
  }
}
