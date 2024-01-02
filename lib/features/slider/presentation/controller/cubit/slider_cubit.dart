import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());
  static SliderCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  int currentIndex = 0;

  Future<void> onSliderChanged(int index) async {
    currentIndex = index;
    emit(ChangeIndexSliderstate());
  }
}
