import 'package:expense_tracker/components/app_logo.dart';
import 'package:expense_tracker/firebase_utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/components/input_field.dart';
import 'package:expense_tracker/components/button.dart';

class SignUpPage extends StatefulWidget {

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){

    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
        
                const SizedBox(height: 15.0,),
        
                const AppLogo(),
        
                const SizedBox(height: 25.0,),
        
                Text(
                  "Sign Up to track",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
        
                const SizedBox(height: 20.0,),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InputField(hintText: "Email", controller: emailController,),
                ),


                const SizedBox(height: 15.0,),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InputField(hintText: "Password", obscuredText: true, controller: passwordController,),
                ),
        
                const SizedBox(height: 20.0,),
        
                Button(
                  btnText: "Sign Up",
                  callbackFunction: () async {
                    await signupWithEmailAndPassword(email: emailController.text, password: passwordController.text, context: context);
                    Navigator.pushNamed(context, '/login');
                  },
                  ),
        
                const SizedBox(height: 20.0,),
        
                Text(
                  "or",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 20.0,),

                ImageButton(
                  imagePath: "assets/images/search.png", 
                  width: 60.0, 
                  height: 60.0,
                  callbackFunction: () {
                    print("sign up with google");
                  },
                  ),

                const SizedBox(height: 15.0,),
        
                Text(
                  "Sign in with google",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 25.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alrady a member? ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      )
                    ),

                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800
                        )
                      ),
                    )
                  ],
                )
                
              ],
            ),
          ),
        ),
      )
    );
  }
}