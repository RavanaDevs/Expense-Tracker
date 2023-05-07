import 'package:expense_tracker/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Home'),
            ElevatedButton(onPressed: (){AuthHelper().signOut();}, child: Text('Log Out'))
          ],
        ),
      ),
    );
  }
}