part of 'slider_cubit.dart';

sealed class SliderState {
  const SliderState();
}

final class SliderInitial extends SliderState {}

final class ChangeIndexSliderstate extends SliderState {}
