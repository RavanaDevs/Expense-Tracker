import 'package:expense_tracker/views/auth_page.dart';
import 'package:expense_tracker/views/login_page.dart';
import 'package:expense_tracker/views/profile_page.dart';
import 'package:expense_tracker/views/home_page.dart';
import 'package:expense_tracker/views/myexpenses_page.dart';
import 'package:expense_tracker/views/signup_page.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const AuthPage(),
        '/login':(context) => const LoginPage(),
        '/sign-up':(context) => const SignUpPage(),
        '/home':(context) => const HomePage(),
        '/profile':(context) => const ProfilePage(),
        '/expenses':(context) => const MyExpensesPage(),
      },
    );
  }
}