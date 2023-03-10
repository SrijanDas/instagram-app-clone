import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> loginUser({
    required String email,
    required String password
}) async {
    String res = "Something went wrong!";



    try{
      if(!email.isEmpty || !password.isEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
      else{
        res = "Please fill in all the fields";
      }

    } on FirebaseAuthException catch(err) {
      print(err);
      res = err.code.toString();
    }
    catch(e) {
      print(e);
          res = e.toString();
    }

    return res;
}

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List image
  }) async {
    String res = "Error creating account!";
    try {
      if (email.isEmpty ||
          password.isEmpty ||
          username.isEmpty ||
          bio.isEmpty) {
        return "Please fill in all the fields";
      }

      //  register user
      UserCredential userCreds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firestore.collection("users").doc(userCreds.user?.uid).set({
        'username': username,
        'uid': userCreds.user?.uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
      });
      res = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "Please give a valid email id";
      } else if (err.code == "email-already-in-use") {
        res = "This email is already used by another user";
      }
      print(err);
    } catch (e) {
      print(e);
      res = e.toString();
    }
    return res;
  }
}
