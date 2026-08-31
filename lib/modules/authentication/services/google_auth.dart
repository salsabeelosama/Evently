import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn.instance;

  Future<bool> signInWithGoogle() async {
    try {
      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> signIn({
  required String email,
  required String password,
}) async {
  try {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
  } on FirebaseAuthException catch (e) {
    log(e.toString());
    return false;
  }
}


Future<bool> signUp({
  required String email,
  required String password,
}) async {
  try {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
  } on FirebaseAuthException catch (e) {
    log(e.toString());
    return false;
  }
}

  Future<void> googleSignOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
}
