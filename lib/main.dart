import 'package:flutter/material.dart';
import 'package:wassubapp/pages/sub_page.dart';
import 'package:wassubapp/themes/default_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkMode,
      home: const SubPage(),
    );
  }
}
