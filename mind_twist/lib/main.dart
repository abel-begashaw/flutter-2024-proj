import 'package:flutter/material.dart';
import 'package:mind_twist/presentation/screens/home.dart';
import 'package:mind_twist/presentation/screens/home_screen.dart';
import 'package:mind_twist/presentation/screens/profile.dart';
import 'package:mind_twist/presentation/screens/signIn.dart';
import 'package:mind_twist/presentation/screens/signUp.dart';
import 'package:mind_twist/presentation/screens/teaser_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/profile': (context) => const ProfilePage(),
        '/home_screen': (context) => const HomeScreen(),
        '/teaser': (context) => const TeaserScreen(),
      },
    );
  }
}
