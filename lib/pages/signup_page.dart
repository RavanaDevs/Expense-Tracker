import 'package:expense_tracker/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function? switchPage;
  const SignUpPage({super.key, this.switchPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  signUp(){
    final email = emailController.text;
    final password = passwordController.text;
    AuthHelper().signUp(email, password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
              ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password'
              ),
              ),
            ElevatedButton(onPressed: ()=> signUp(), child: Text('Sign Up')),
            GestureDetector(
              onTap: () => widget.switchPage!(),
              child: Text('Login'),
            )
          ],
        ),
        ),
    );
  }
}