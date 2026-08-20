import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VOCAB1());
}

class VOCAB1 extends StatelessWidget {
  const VOCAB1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'VOCAB1',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const HomeScreen(),
    );
  }
}