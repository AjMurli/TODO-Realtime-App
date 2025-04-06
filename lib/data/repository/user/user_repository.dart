import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../../../models/user/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository {

  final _db =  FirebaseFirestore.instance;

  // Function to save user data to fireStore
  Future<void> createUser(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    }on FormatException catch (_) {
      throw const CustomFormatException();
    }on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  // Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails({required String uid}) async {
    try{
      final docSnapshot = await _db.collection("Users").doc(uid).get();
      return UserModel.fromSnapshot(docSnapshot);
    }on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    }on FormatException catch (_) {
      throw const CustomFormatException();
    }on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }


}
