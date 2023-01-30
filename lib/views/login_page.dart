import 'package:expense_tracker/components/app_logo.dart';
import 'package:expense_tracker/firebase_utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/components/button.dart';
import 'package:expense_tracker/components/input_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context)  {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
        
                const SizedBox(height: 25.0,),
        
                const AppLogo(),
        
                const SizedBox(height: 25.0,),
        
                Text(
                  "Log in to Track",
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
// login ==============================>                
                Button(
                  btnText: "Log In",
                  callbackFunction: () {
                    signInWithEmailAndPassword(
                      email: emailController.text, 
                      password: passwordController.text, 
                      context: context
                    );
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
                    print("log in with google");
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
                      "Not a member? ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      )
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      child: const Text(
                        "Register",
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
      ),
    );
  }
}