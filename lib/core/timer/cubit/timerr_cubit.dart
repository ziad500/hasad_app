import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'timerr_state.dart';

class TimerrCubit extends Cubit<TimerrState> {
  TimerrCubit(super.initialState);
  static TimerrCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  late Timer _timer;
  late int start;

  void startTimer(DateTime date) {
    Duration difference = DateTime.now().difference(date).abs();
    start = difference.inSeconds;
    if (!checkTimer(date)) {
      emit(StartTimerState(TimerState(timerDisplay, false)));
      const oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          if (start == 0) {
            cancelTimer();
          } else {
            start--;
            checkTimer(date);
            emit(CheckTimerrState(TimerState(timerDisplay, true)));
          }
        },
      );
    } else {
      start = 0;
    }
  }

  bool checkTimer(DateTime date) {
    if (date.isBefore(DateTime.now())) {
      return true;
    } else {
      return false;
    }
  }

  String get timerDisplay {
    Duration duration = Duration(seconds: start);
    int days = duration.inDays;
    int hours = duration.inHours % 24; // Adjust for remaining hours after subtracting days
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void cancelTimer() {
    _timer.cancel();
    emit(CancelTimerState(TimerState('0:00', true)));
  }
}
