import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/get_bidding_details_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

part 'bidding_details_state.dart';

class BiddingDetailsCubit extends Cubit<BiddingDetailsState> {
  final GetBiddingDetailsUseCase _getBiddingDetailsUseCase;
  BiddingDetailsCubit(this._getBiddingDetailsUseCase) : super(BiddingDetailsInitial());

  static BiddingDetailsCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  DirectSellingDataModel? directSellingDataModel;
  Future<void> getBiddingList(String id) async {
    emit(GetBiddingDetailsLoadingState());
    await _getBiddingDetailsUseCase
        .execude(id)
        .then((value) => value.fold((l) => emit(GetBiddingDetailsErrorState(l.message)), (r) {
              directSellingDataModel = r.data;
              emit(GetBiddingDetailsSuccessState());
            }));
  }

  int currentIndex = 0;

  Future<void> onSliderChanged(int index) async {
    currentIndex = index;
    emit(ChangeIndexSliderstate());
  }
}
