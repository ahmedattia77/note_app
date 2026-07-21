import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/feature/create_profile/data/model/user_model.dart';
import 'package:note_app/feature/create_profile/presentation/pages/create_profile.dart';
import 'package:note_app/feature/home/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _pageRote() {
    final userBox = Hive.box<UserModel>('userBox');
    return userBox.isEmpty ? CreateProfile() : HomeScreen();
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _pageRote()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          height: 250,
          width: 250,
          'assets/lottie/splash_logo.json',
        ),
      ),
    );
  }
}
