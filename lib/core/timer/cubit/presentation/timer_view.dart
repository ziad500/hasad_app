import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/default_text_button.dart';
import 'package:hasad_app/core/timer/cubit/timerr_cubit.dart';
import '../../../../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeObject extends StatelessWidget {
  const TimeObject({super.key, required this.date, required this.onPressed});
  final String date;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TimerrCubit(TimerrInitial(TimerState("", false)))..startTimer(DateTime.parse(date)),
      child: BlocBuilder<TimerrCubit, TimerrState>(
        builder: (context, state) {
          return TimerrCubit.get(context).timerDisplay == "00:00"
              ? DefaultTextButton(
                  onPressed: onPressed,
                  text: "اعادة ارسال الكود",
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.primaryColor, decoration: TextDecoration.underline),
                )
              : DefaultText(
                  text: "اعاده ارسال الكود في | ${TimerrCubit.get(context).timerDisplay}",
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.red, decoration: TextDecoration.underline),
                );
        },
      ),
    );
  }
}
