import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_twist/core/domain/auth/auth_cubit.dart';
import 'package:mind_twist/core/domain/auth/auth_state.dart';
import 'package:mind_twist/core/domain/auth/auth_repository_interface.dart';
import 'package:mind_twist/presentation/screens/admin/admin.dart';
import 'package:mind_twist/presentation/screens/home/home_screen.dart';
import 'package:mind_twist/presentation/screens/profile/profile.dart';
import 'package:mind_twist/presentation/screens/teaser/analytics_screen.dart';
import 'package:mind_twist/presentation/screens/teaser/teaser_screen.dart';
import 'package:mind_twist/presentation/screens/welcome/landing_page.dart';
import 'package:mind_twist/presentation/screens/welcome/signIn.dart';
import 'package:mind_twist/presentation/screens/welcome/signUp.dart';
import 'package:mind_twist/presentation/screens/profile/update_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Actual Auth Repository (Communicates with Backend)
class AuthRepository implements AuthRepositoryInterface {
  final String _baseUrl = 'http://192.168.42.1:3000/api/auth';

  Future<void> signUp(
      {required String username, required String password}) async {
    final response = await http.post(Uri.parse('$_baseUrl/signup'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await _storeAuthData(data['token'], data['userId']);
    } else {
      throw Exception('Signup failed: ${response.statusCode}');
    }
  }

  Future<void> signIn(
      {required String username, required String password}) async {
    final response = await http.post(Uri.parse('$_baseUrl/signin'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _storeAuthData(data['token'], data['userId']);
    } else {
      throw Exception('Signin failed: ${response.statusCode}');
    }
  }

  Future<void> signOut() async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
      prefs.remove('userId');
    });
  }

  Future<void> _storeAuthData(String token, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('userId', userId);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authRepository = AuthRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepository: authRepository),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/teaser',
        builder: (context, state) => const TeaserScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/update_profile',
        builder: (context, state) => const UpdateProfilePage(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminPage(),
      ),
      GoRoute(
        path: '/frame',
        builder: (context, state) => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return const MainContainer();
            } else {
              return const LandingPage();
            }
          },
        ),
      ),
    ],
  );
}

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const HomeScreen();
          } else {
            return const LandingPage();
          }
        },
      ),
    );
  }
}

class Authenticated {}
