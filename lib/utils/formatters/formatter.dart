import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Customize the date format as needed
  }

  String? validateField(String? value, {required String type}) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $type';
    }

    switch (type) {
      case 'email':
        final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegExp.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        break;

      case 'password':
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        break;

      case 'taskTitle':
        if (value.length < 4) {
          return 'Title must be at least 4 characters';
        }
        break;

      case 'taskDes':
        if (value.length < 10) {
          return 'Description must be at least 10 characters';
        }
        break;

      default:
        return null;
    }

    return null;
  }


}
