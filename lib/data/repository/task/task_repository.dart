import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../../models/task/task_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class TaskRepository {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

// Get all Tasks from the 'AllTasks' collection
  Stream<List<TaskModel>> getTasksForUser(String email) {
    return _db.collection('AllTasks')
        .where('SharedWithEmails', arrayContains: email)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => TaskModel.fromSnapshot(doc)).toList());
  }

  // Create a new Task document in the 'AllTasks' collection
  Future<String> createTask(TaskModel task) async {
    try {
      final data = await _db.collection('AllTasks').add(task.toJson());
      return data.id;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
       await _db.collection('AllTasks').doc(task.id).update(task.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }
  Future<void> updateTaskEmailId({required String taskId, required List<String> sharedWithEmails}) async {
    try {
      await _db.collection('AllTasks').doc(taskId).update({
        'SharedWithEmails': sharedWithEmails,
      });
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }

  Future<TaskModel> getTaskById(String taskId) async {
    try {
      final doc = await _db.collection('AllTasks').doc(taskId).get();
      return TaskModel.fromSnapshot(doc);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }




}