part of 'slider_cubit.dart';

sealed class SliderState {
  const SliderState();
}

final class SliderInitial extends SliderState {}

final class ChangeIndexSliderstate extends SliderState {}

final class SliderLoadingState extends SliderState {}

final class SliderSuccessState extends SliderState {}

final class SliderErrorState extends SliderState {
  final String message;
  const SliderErrorState(this.message);
}
