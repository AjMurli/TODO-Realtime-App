import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:todo_realtime_app/utils/constants/app_assets.dart';
import 'package:todo_realtime_app/utils/widgets/widgets_imports.dart';
import 'package:todo_realtime_app/view/task/tasks_screen_imports.dart';

import '../../data/repository/auth/auth_repository.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/formatters/formatter.dart';
import '../../view_model/auth/auth_view_model.dart';

part 'login_screen.dart';
part 'responsive_screens/login_desktop_screen.dart';
part 'responsive_screens/login_mobile_screen.dart';
part 'responsive_screens/login_tablet_screen.dart';
part 'responsive_screens/splash_screen.dart';