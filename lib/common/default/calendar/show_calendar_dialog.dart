/* import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pethome/common/default/default_text_button.dart';
import 'package:pethome/common/range_calendar_widget.dart';
import 'package:pethome/utils/app_colors.dart';

Future showCalendarDialog(
        {required BuildContext context,
        required dynamic Function(DateTime, DateTime) onDaySelected,
        required void Function() doneFunction,
        DateTime? startRange,
        DateTime? endRange}) =>
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7).w),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(7).w),
                      width: double.maxFinite,
                      child: RangeCalendarWidget(
                        onDaySelected: onDaySelected,
                        startRange: startRange,
                        endRange: endRange,
                      )),
                  Row(
                    children: [
                      DefaultTextButton(
                        onPressed: () {},
                        text: "موافق",
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.primaryColor),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      DefaultTextButton(
                          onPressed: () => Navigator.pop(context),
                          text: "إلغاء",
                          textStyle: Theme.of(context).textTheme.labelMedium),
                    ],
                  )
                ],
              ),
            ),
          );
        });
 */