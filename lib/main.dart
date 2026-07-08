import 'package:flutter/material.dart';
import 'package:note_app/feature/create_profile/presentation/pages/create_profile.dart';

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
      home: Scaffold(body: CreateProfile()),
    );
  }
}
