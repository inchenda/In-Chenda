import 'package:flutter/material.dart';
import 'package:flutter_application_1/project_app/About_Us%20.dart';
import 'package:flutter_application_1/project_app/Login_page.dart';
import 'package:flutter_application_1/project_app/layout_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project App',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/', // Start with LoginPage
      routes: {
        '/': (context) => const LoginPage(),
        '/layout': (context) => const LayoutScreen(),
        '/about': (context) => const AboutUsPage(),
      },
    );
  }
}
