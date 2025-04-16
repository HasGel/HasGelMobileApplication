import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prova/Manager/DatabaseManager.dart';
import 'dart:developer';
import 'package:prova/Utils/AuthResult.dart';
import 'package:prova/Model/AuthUser.dart';


class AuthManager {

  final _auth = FirebaseAuth.instance;
  final _firestore = DataBaseManager();

  Future<AuthResult> createUserWithEmailAndPassword(
      String email,
      String password,
      String name) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AuthUser user = AuthUser(
        id: credential.user!.uid,
        email: email,
        name: name,
        isAdmin: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestore.createUser(user);

      print("signed-up");
      return AuthResult(user: user, success: true);
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        error: _handleFirebaseError(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  // AuthUser tipine gerek olmayabilir kayra
  Future<AuthResult> loginUserWithEmailAndPassword(String email,
      String password,) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get custom user data
      /*final doc = await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .get();
      */
      return AuthResult(
        success: true,
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        error: _handleFirebaseError(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }

  String _handleFirebaseError(String code) {
    switch (code) {
      case 'weak-password':
        return 'Password must be at least 6 characters';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'Authentication failed';
    }
  }
}