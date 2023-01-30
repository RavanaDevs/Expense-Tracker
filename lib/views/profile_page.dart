import 'package:expense_tracker/components/button.dart';
import 'package:expense_tracker/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const _ProfilePage();
        }else{
          return const LoginPage();
        }
      },
    );
  }
}

class _ProfilePage extends StatelessWidget {

  const _ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      // back button
                      CustomIconButton(
                        icon: const Icon(Icons.arrow_back), 
                        callbackFunction: (){
                          Navigator.pushNamed(context, '/home');
                        },
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 55.0,),
          
                Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    border: Border.all(width:7.0, color: Colors.black),
                    borderRadius: BorderRadius.circular(150.0),
                    color: Colors.white70
                  ),
                  width: 150.0,
                  height: 150.0,
                  child: Image.asset("assets/images/user.png"),
                ),
          
                const SizedBox(height: 35.0,),
          
                const Text(
                  "Hi,",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54
                  ),
                ),
          
                const SizedBox(height: 10.0,),
          
                Text(
                  FirebaseAuth.instance.currentUser?.email ?? "No user",
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.blue
                  ),
                ),
          
                const SizedBox(height: 50.0,),
          
                const Text(
                  "Total Expenses",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54
                  ),
                ),
          
                const SizedBox(height: 10.0,),
          
                const Text(
                  "Rs. 12000.00",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.blue
                  ),
                ),
          
                const SizedBox(height: 150.0,),
          
                Button(btnText: "Log Out", callbackFunction: (){
                  FirebaseAuth.instance.signOut();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}