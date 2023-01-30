import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> signupWithEmailAndPassword({
  required String email, 
  required String password,
   required BuildContext context
}) async{

  showDialog(context: context, builder: ((context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }));

  

  try{
  final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(e){
    print(e.message);
  }


  Navigator.pop(context);

}

Future<void> signInWithEmailAndPassword({
  required String email, 
  required String password,
  required BuildContext context,
  }) async { 

    showDialog(context: context, builder: ((context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }));

    try{
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      print(e);
    }

    Navigator.pop(context);

}