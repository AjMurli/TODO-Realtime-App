import 'dart:developer';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:todo_realtime_app/utils/constants/app_colors.dart';
import 'package:todo_realtime_app/utils/constants/app_strings.dart';
import 'package:todo_realtime_app/utils/device/device_utility.dart';
import 'package:todo_realtime_app/utils/formatters/formatter.dart';
import 'package:todo_realtime_app/view/task_details/task_details_imports.dart';
import 'package:todo_realtime_app/view_model/task/task_view_model.dart';
import '../../models/task/task_model.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/widgets/widgets_imports.dart';

part 'tasks_screen.dart';
part 'responsive_screens/tasks_desktop_screen.dart';
part 'responsive_screens/tasks_tablet_screen.dart';
part 'responsive_screens/tasks_mobile_screen.dart';
part 'widgets/todo_card_widget.dart';
part 'widgets/create_task_bottom_sheet.dart';
