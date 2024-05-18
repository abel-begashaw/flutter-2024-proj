import 'package:flutter/material.dart';
import 'package:mind_twist/presentation/screens/admin.dart';
import 'package:mind_twist/presentation/screens/analytics_screen.dart';
import 'package:mind_twist/presentation/screens/landing_page.dart';
import 'package:mind_twist/presentation/screens/home_screen.dart';
import 'package:mind_twist/presentation/screens/profile/profile.dart';
import 'package:mind_twist/presentation/screens/signIn.dart';
import 'package:mind_twist/presentation/screens/signUp.dart';
import 'package:mind_twist/presentation/screens/teaser_screen.dart';
import 'package:mind_twist/presentation/screens/profile/update_profile.dart';

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
        '/': (context) => const LandingPage(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/profile': (context) => const ProfilePage(),
        '/home_screen': (context) => const HomeScreen(),
        '/analytics': (context) => const AnalyticsScreen(),
        '/teaser': (context) => const TeasersScreen(),
        '/update_profile': (context) => const UpdateProfilePage(),
        '/admin': (context) => const AdminPage()
      },
    );
  }
}
