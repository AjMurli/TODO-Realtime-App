import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_realtime_app/firebase_options.dart';
import 'package:todo_realtime_app/utils/constants/app_strings.dart';
import 'package:todo_realtime_app/view/auth/login_imports.dart';
import 'package:todo_realtime_app/view/task/tasks_screen_imports.dart';
import 'package:todo_realtime_app/view_model/auth/auth_view_model.dart';
import 'package:todo_realtime_app/view_model/task/task_view_model.dart';

import 'data/repository/auth/auth_repository.dart';
import 'utils/routes/deep_link/deep_link_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
        ChangeNotifierProvider(create: (ctx) => TaskViewModel()),
      ],
      child: MaterialApp(
          title: AppString.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const DeepLinkListener(child: SplashScreen())
      ),
    );
  }
}

