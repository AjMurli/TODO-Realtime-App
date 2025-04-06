import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthRepository {

  final _auth = FirebaseAuth.instance;


  // LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const CustomFormatException();
    }on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }


  // REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const CustomFormatException();
    }on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }


  // LOGOUT USER
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const CustomFormatException();
    }on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

  bool isUserLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      // Navigate to Home
      return true;
    } else {
      // Navigate to Login
      return false;
    }
  }

}