part of 'timerr_cubit.dart';

sealed class TimerrState {
  const TimerrState();
}

class TimerrInitial extends TimerrState {
  final TimerState timerState;
  const TimerrInitial(this.timerState);
}

class StartTimerState extends TimerrState {
  final TimerState timerState;
  const StartTimerState(this.timerState);
}

class CheckTimerrState extends TimerrState {
  final TimerState timerState;
  const CheckTimerrState(this.timerState);
}

class CancelTimerState extends TimerrState {
  final TimerState timerState;
  const CancelTimerState(this.timerState);
}

class TimerState {
  final String timerDisplay;
  final bool sentCodeAgainValidate;

  TimerState(this.timerDisplay, this.sentCodeAgainValidate);
}
