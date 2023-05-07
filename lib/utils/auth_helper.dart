import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper{

  final _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  Future<bool> signIn(String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;

    } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
        return false;

      } catch (e) {
        print(e);
        
        return false;
    }
  }



  Future<void> signOut() async{
    await _auth.signOut();
  }

}