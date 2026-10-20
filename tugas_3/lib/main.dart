import 'package:flutter/material.dart';
import 'package:tugas_3/BMIScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMIScreen(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}