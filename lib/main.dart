import 'package:expense_tracker/pages/login_page.dart';
import 'package:expense_tracker/pages/profile_page.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/pages/myexpenses_page.dart';
import 'package:expense_tracker/pages/signup_page.dart';

import 'package:flutter/material.dart';

void main() {
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
        '/':(context) => const LoginPage(),
        '/sign-up':(context) => const SignUpPage(),
        '/home':(context) => const HomePage(),
        '/profile':(context) => const ProfilePage(),
        '/expenses':(context) => const MyExpensesPage(),
      },
    );
  }
}