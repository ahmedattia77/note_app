import 'package:flutter/material.dart';
import 'package:note_app/core/services/hive/init_hive.dart';
import 'package:note_app/feature/splash_screen/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitHive.initialHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      home: const SplashScreen(),
    );
  }
}
