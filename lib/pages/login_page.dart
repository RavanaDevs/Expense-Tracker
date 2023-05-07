import 'package:expense_tracker/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function? switchPage;
  const LoginPage({super.key, this.switchPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  logIn(){
    final email = emailController.text;
    final password = passwordController.text;
    AuthHelper().signIn(email, password);

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
            ElevatedButton(onPressed: ()=> logIn(), child: Text('Log In')),
            GestureDetector(
              onTap: () => widget.switchPage!(),
              child: Text('Sign Up'),
            )
          ],
        ),
        ),
    );
  }
}