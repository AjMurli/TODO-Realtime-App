import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:todo_realtime_app/view/task_details/task_details_imports.dart';

class DeepLinkListener extends StatefulWidget {
  final Widget child;
  const DeepLinkListener({super.key, required this.child});

  @override
  State<DeepLinkListener> createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  @override
  void initState() {
    super.initState();
    final appLinks = AppLinks();
    final sub = appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri == null) return;
      log('URI: ${uri.toString()}');
      final id = uri.pathSegments.lastOrNull;
      log('URI TaskID: $id');

      if (id != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsScreen(taskId: id),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}


