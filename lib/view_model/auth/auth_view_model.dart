import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_realtime_app/data/repository/auth/auth_repository.dart';
import 'package:todo_realtime_app/data/repository/user/user_repository.dart';

import '../../models/user/user_model.dart';
import '../../view/task/tasks_screen_imports.dart';

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void setIsLogin(bool newValue) {
    _isLogin = newValue;
    notifyListeners();
  }


  Future<bool> registerUser(BuildContext context) async {
    try {
      setLoading(true);
      UserCredential userCredential = await AuthRepository().registerWithEmailAndPassword(emailIdController.text.trim(), passwordController.text.trim());

      await UserRepository().createUser(
          UserModel(
            userName: 'User',
            id: userCredential.user!.uid,
            email: userCredential.user!.email!,
            createdAt: DateTime.now(),
          )
      );
      log('User Created Successfully');
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const TasksScreen()));
      setLoading(false);
      emailIdController.clear();
      passwordController.clear();
      return true;
    } catch(e, stackTrace) {
      setLoading(false);
      log('Sign Up Error: $e || $stackTrace');
      throw e;
    }
  }

}