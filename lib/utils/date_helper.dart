import 'package:flutter/material.dart';
import 'package:hasad_app/utils/app_colors.dart';

import '../core/constants.dart';
import 'package:intl/intl.dart';

String getDayName(DateTime date) {
  final formatter = DateFormat('EEEE', Constants.isArabic ? 'ar' : 'en');
  return formatter.format(date);
}

String getDateWithoutTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
}

// Tue, Nov 5
String formatDateString(String inputDate) {
  DateTime date = DateTime.parse(inputDate).toLocal();
  DateFormat formatter = DateFormat('EEE, d MMM yyyy', Constants.isArabic ? 'ar' : 'en');
  String formattedDate = formatter.format(date);
  return formattedDate;
}

Future<DateTime?> showDatePickerFunction(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            onPrimary: AppColors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      );
    },
  );

  return picked;
}
