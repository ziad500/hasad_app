/* import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/font_manager.dart';
import '../core/constants.dart';

class RegularCalendarWidget extends StatefulWidget {
  const RegularCalendarWidget(
      {super.key,
      required this.onDaySelected,
      this.startRange,
      this.endRange,
      this.firstDay,
      this.endDay,
      this.disabledDays,
      this.events});
  final Function(DateTime, DateTime) onDaySelected;
  final DateTime? startRange;
  final DateTime? endRange;
  final DateTime? firstDay;
  final DateTime? endDay;
  final List<String>? disabledDays;
  final Map<DateTime, List>? events;

  @override
  State<RegularCalendarWidget> createState() => _RegularCalendarWidgetState();
}

class _RegularCalendarWidgetState extends State<RegularCalendarWidget> {
  static DateTime _selectedDay = DateTime.now();

  static DateTime _focusedDay = DateTime.now();

  @override
  void dispose() {
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    super.dispose();
  }

  /*  Map<DateTime, List> events =
      {} */ /*  {
    DateTime(2023, 11, 28): ['Event 1', 'Event 2'], // Events for November 28, 2023
    DateTime(2023, 11, 23): ['Event 3'], // Events for November 29, 2023
    DateTime(2023, 11, 29): ['Event 1', 'Event 2'], // Events for November 28, 2023

    DateTime(2023, 11, 30): ['Event 1'], // Events for November 28, 2023

    // Add more events as needed
  } */

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              Constants.isArabic ? getDayName(day).substring(2) : getDayName(day).substring(0, 3),
              style: TextStyle(fontSize: FontSize.s16, color: AppColors.black),
            ),
          ),
        ),
        selectedBuilder: (context, day, focusedDay) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryColor,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  day.day.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.white, fontSize: FontSize.s14),
                ),
              ),
            ),
          );
        },
        holidayBuilder: (context, day, focusedDay) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 13),
            child: Text(
              day.day.toString(),
              style: TextStyle(color: Colors.grey, fontSize: FontSize.s14),
            ),
          );
        },
        disabledBuilder: (context, day, focusedDay) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: Text(
              day.day.toString(),
              style: TextStyle(color: Colors.grey, fontSize: FontSize.s14),
            ),
          );
        },
        defaultBuilder: (context, day, focusedDay) {
          /*   List<String> disapled = [];
          if (widget.disabledDays != null) {
            disapled = Constants.days.where((day) => !widget.disabledDays!.contains(day)).toList();
          } */

          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                day.day.toString(),
                style: TextStyle(
                    fontWeight: (widget.events == null || widget.events!.isEmpty)
                        ? FontWeight.normal
                        : FontWeight.bold,
                    color: (widget.events == null || widget.events!.isEmpty)
                        ? Colors.black
                        : widget.events!.containsKey(DateTime(day.year, day.month, day.day))
                            ? Colors.black
                            : Colors
                                .grey /* disapled.contains(getDayName(day)) ? Colors.black : Colors.grey */,
                    fontSize: FontSize.s14),
              ),
            ),
          );
        },
      ),
      locale: Constants.isArabic ? 'ar' : 'en',
      focusedDay: _focusedDay,
      availableGestures: AvailableGestures.none,
      firstDay: widget.firstDay ?? DateTime(2000, 1, 1, 0, 0, 0),
      rangeStartDay: widget.startRange,
      rangeEndDay: widget.endRange,
      lastDay: widget.endDay ?? kLastDay,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(fontSize: FontSize.s14, fontWeight: FontWeight.bold),
          weekendStyle: TextStyle(fontSize: FontSize.s14, fontWeight: FontWeight.bold)),
      calendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
          rangeEndDecoration: const BoxDecoration(color: AppColors.primaryColor),
          rangeStartDecoration:
              const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
          rangeHighlightColor: AppColors.primaryColor.withOpacity(0.15),
          defaultTextStyle: TextStyle(color: Colors.black, fontSize: FontSize.s14),
          holidayTextStyle: TextStyle(color: Colors.black, fontSize: FontSize.s14),
          weekendTextStyle: TextStyle(color: Colors.black, fontSize: FontSize.s14),
          tablePadding: const EdgeInsets.only(top: 0),
          defaultDecoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          selectedDecoration:
              const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle)),
      daysOfWeekHeight: 25,
      eventLoader: (day) {
        return widget.events?[DateTime(day.year, day.month, day.day)] ?? [];
      },
      headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.zero,
          leftChevronIcon: Padding(
            padding: EdgeInsets.only(
                left: Constants.isArabic ? 0 : 8, right: Constants.isArabic ? 8 : 0),
            child: const Icon(
              size: 20,
              Icons.arrow_back_ios,
              color: AppColors.iconColor,
            ),
          ),
          rightChevronIcon: Padding(
            padding: EdgeInsets.only(
                left: Constants.isArabic ? 0 : 8, right: Constants.isArabic ? 8 : 0),
            child: const Icon(
              size: 20,
              Icons.arrow_forward_ios,
              color: AppColors.iconColor,
            ),
          ),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.s16),
          formatButtonVisible: false,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.2)))),
          titleCentered: true),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        List<String> disapled = [];
        if (widget.disabledDays != null) {
          disapled = Constants.days.where((day) => !widget.disabledDays!.contains(day)).toList();
        }
        if (!disapled.contains(getDayName(selectedDay))) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            widget.onDaySelected(selectedDay, focusedDay);
            setState(() {});
          }
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
 */