import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/details/domain/use_cases/get_direct_selling_details_usecase.dart';

part 'direct_selling_details_state.dart';

class DirectSellingDetailsCubit extends Cubit<DirectSellingDetailsState> {
  final GetDirectSellingDetailsUseCase _getDirectSellingDetailsUseCase;
  DirectSellingDetailsCubit(this._getDirectSellingDetailsUseCase)
      : super(DirectSellingDetailsInitial());

  static DirectSellingDetailsCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  DirectSellingDataModel? directSellingDataModel;
  Future<void> getDirectSellingList(String id) async {
    emit(GetDirectSellingDetailsLoadingState());
    await _getDirectSellingDetailsUseCase
        .execude(id)
        .then((value) => value.fold((l) => emit(GetDirectSellingDetailsErrorState(l.message)), (r) {
              directSellingDataModel = r.data;
              emit(GetDirectSellingDetailsSuccessState());
            }));
  }

  int currentIndex = 0;

  Future<void> onSliderChanged(int index) async {
    currentIndex = index;
    emit(ChangeIndexSliderstate());
  }
}
