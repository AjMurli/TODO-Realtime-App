
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_realtime_app/data/repository/auth/auth_repository.dart';
import 'package:todo_realtime_app/data/repository/task/task_repository.dart';
import 'package:todo_realtime_app/models/task/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDesController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  final TaskRepository _repository = TaskRepository();
  final taskFormKey = GlobalKey<FormState>();
  List<String> sharedWithEmails = [];

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  Stream<List<TaskModel>>? _taskStream;
  Stream<List<TaskModel>>? get taskStream => _taskStream;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  // Initialize stream for the user
  void initTaskStream(String email) {
    _taskStream = _repository.getTasksForUser(email);
    notifyListeners();
  }

  bool checkUserAlreadyLogin() {
    bool isLoggedIn = AuthRepository().isUserLoggedIn();
    if(isLoggedIn) {
      return true;
    }else{
      return false;
    }
  }


  Future<void> createTask(BuildContext context) async {
    try{
      setLoading(true);
        final task = TaskModel(
            id: '',
            ownerId: FirebaseAuth.instance.currentUser!.uid,
            title: taskTitleController.text.trim(),
            description: taskDesController.text.trim(),
            sharedWithEmails: [FirebaseAuth.instance.currentUser!.email!],
            createdAt: DateTime.now(),
        );
        await _repository.createTask(task);
        log('Task Created Successfully');
        taskTitleController.clear();
        taskDesController.clear();
        setLoading(false);
        Navigator.pop(context);
    }catch(e, stackTrace) {
      setLoading(false);
      log('Sign Up Error: $e || $stackTrace');
    }
  }


  Stream<List<TaskModel>> fetchTasks(String email) {
    return _repository.getTasksForUser(email);
  }

  Future<void> updateTask(TaskModel task) async {
    await _repository.updateTask(task);
  }
  TaskModel? taskModel;

  Future<void> fetchTaskById(String taskId) async {
    taskModel = await _repository.getTaskById(taskId);
    taskTitleController.text = taskModel!.title;
    taskDesController.text = taskModel!.description;
    sharedWithEmails = taskModel!.sharedWithEmails;
    log('taskModel!.sharedWithEmails: ${taskModel!.sharedWithEmails}');
  }

  void addRemoveEmail({required String taskId, String? deleteEmail}) async {
    if (deleteEmail != null) {
      sharedWithEmails.remove(deleteEmail);
    } else {
      if (emailIdController.text.trim().isNotEmpty) {
        sharedWithEmails.add(emailIdController.text.trim());
        emailIdController.clear();
      }
    }

    await _repository.updateTaskEmailId(
      taskId: taskId,
      sharedWithEmails: sharedWithEmails,
    );
    notifyListeners();

  }


}