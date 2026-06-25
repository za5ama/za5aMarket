import 'package:flutter/material.dart';
import 'package:za5amarket/pages/login.dart';
import 'package:za5amarket/pages/screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'za5amarket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(254, 101, 1, 0)),
      ),
      home: const loginPage(),
    );
  }
}

