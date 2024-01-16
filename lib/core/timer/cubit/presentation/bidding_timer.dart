import 'package:hasad_app/core/timer/cubit/timerr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiddingTimeObject extends StatelessWidget {
  const BiddingTimeObject({super.key, required this.date, required this.child});
  final String date;
  final Widget Function(String) child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TimerrCubit(TimerrInitial(TimerState("", false)))..startTimer(DateTime.parse(date)),
      child: BlocBuilder<TimerrCubit, TimerrState>(
        builder: (context, state) {
          return child(TimerrCubit.get(context).biddingDisplay);
          /*   TimerrCubit.get(context).biddingDisplay == "00:00"
              ? DefaultText(
                  text: "00:00",
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.red, decoration: TextDecoration.underline),
                )
              : DefaultText(
                  text: TimerrCubit.get(context).biddingDisplay,
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.red),
                ); */
        },
      ),
    );
  }
}
