import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_realtime_app/utils/widgets/widgets_imports.dart';

import '../../models/task/task_model.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/formatters/formatter.dart';
import '../../view_model/task/task_view_model.dart';

part 'task_details_screen.dart';
part 'responsive_screens/task_details_laptop_screen.dart';
part 'responsive_screens/task_details_mobile_screen.dart';
part 'responsive_screens/task_details_tablet_screen.dart';
part 'widgets/share_task_bottom_sheet.dart';