import 'package:evently/modules/authentication/services/google_auth.dart';
import 'package:flutter/material.dart';

class 
AuthProvider extends ChangeNotifier {
  final FirebaseServices firebaseServices = FirebaseServices();

  bool isLoading = false;

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    final result = await firebaseServices.signIn(
      email: email,
      password: password,
    );

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<bool> signUp({
  required String email,
  required String password,
}) async {
  isLoading = true;
  notifyListeners();

  final result = await firebaseServices.signUp(
    email: email,
    password: password,
  );

  isLoading = false;
  notifyListeners();

  return result;
}

  Future<bool> signInWithGoogle() async {
    isLoading = true;
    notifyListeners();

    final result = await firebaseServices.signInWithGoogle();

    isLoading = false;
    notifyListeners();

    return result;
  }
}