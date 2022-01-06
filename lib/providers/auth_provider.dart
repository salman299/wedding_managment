import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Auth with ChangeNotifier {
  String? _udi;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? get userId {
    print("I am here ${_udi}");
    return _udi ?? 'Y6L1idrbwsPGvpYJTESMNBH6II73';
  }

  Future<void> signIn(String email, String password) async {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      _udi = user.uid;
      notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      _udi = user.uid;
      notifyListeners();
  }

  Future<String?> getCurrentUser() async {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return null;
      }
      _udi = user.uid;
      return _udi;
  }

  Future<void> signOut() async {
      await _firebaseAuth.signOut();
      _udi = null;
      notifyListeners();
  }

  Future<void> passwordReset(String _email) async {
      await _firebaseAuth.sendPasswordResetEmail(email: _email);
  }

  Future<void> sendEmailVerification() async {
      final user = _firebaseAuth.currentUser!;
      return user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    final user = _firebaseAuth.currentUser!;
    return user.emailVerified;
  }
}
