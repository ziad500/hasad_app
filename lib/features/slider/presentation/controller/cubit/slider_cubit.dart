import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/slider/domain/models/slider_model.dart';
import 'package:hasad_app/features/slider/domain/use_cases/get_sliders_usecase.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final GetSlidersUseCase _getSlidersUseCase;
  SliderCubit(this._getSlidersUseCase) : super(SliderInitial());
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

  List<SliderDataModel> sliders = [];
  Future<void> getSliders() async {
    emit(SliderLoadingState());
    await _getSlidersUseCase.execude().then((value) => value.fold(
          (l) => emit(SliderErrorState(l.message)),
          (r) {
            sliders = r.data ?? [];
            emit(SliderSuccessState());
          },
        ));
  }
}
