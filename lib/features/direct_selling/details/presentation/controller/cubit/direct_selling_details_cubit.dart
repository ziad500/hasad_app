import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/details/domain/use_cases/buy_direct_selling_usecase.dart';
import 'package:hasad_app/features/direct_selling/details/domain/use_cases/get_direct_selling_details_usecase.dart';

part 'direct_selling_details_state.dart';

class DirectSellingDetailsCubit extends Cubit<DirectSellingDetailsState> {
  final GetDirectSellingDetailsUseCase _getDirectSellingDetailsUseCase;
  final BuyDirectSellingUseCase _buyDirectSellingUseCase;
  DirectSellingDetailsCubit(this._getDirectSellingDetailsUseCase, this._buyDirectSellingUseCase)
      : super(DirectSellingDetailsInitial());

  static DirectSellingDetailsCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  final TextEditingController quantityController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DirectSellingDataModel? directSellingDataModel;
  Future<void> getDirectSellingDetails(String id) async {
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

  Future<void> buyDirectSelling() async {
    emit(BuyDirectSellingLoadingState());
    await _buyDirectSellingUseCase
        .execude(directSellingDataModel!.id.toString(), int.parse(quantityController.text))
        .then((value) => value.fold((l) => emit(BuyDirectSellingErrorState(l.message)), (r) {
              emit(BuyDirectSellingSuccessState(r));
            }));
  }
}
