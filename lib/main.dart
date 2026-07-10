import 'package:flutter/material.dart';
import 'package:note_app/core/colors/app_colors.dart';
import 'package:note_app/feature/create_profile/presentation/pages/create_profile.dart';
import 'package:note_app/feature/home/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 37, 45, 53),
        body: CreateProfile()),
    );
  }
}