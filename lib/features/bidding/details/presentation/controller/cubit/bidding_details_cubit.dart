import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/bid_usecase.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/buy_bidding_advertisement_usecase.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/get_bidding_details_usecase.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/pay_insurance_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

part 'bidding_details_state.dart';

class BiddingDetailsCubit extends Cubit<BiddingDetailsState> {
  final GetBiddingDetailsUseCase _getBiddingDetailsUseCase;
  final BuyBiddingAdverticseUseCase _buyBiddingAdverticseUseCase;
  final BidBiddingAdverticseUseCase _bidBiddingAdverticseUseCase;
  final PayInsuranceBiddingAdverticseUseCase _payInsuranceBiddingAdverticseUseCase;
  BiddingDetailsCubit(this._getBiddingDetailsUseCase, this._buyBiddingAdverticseUseCase,
      this._bidBiddingAdverticseUseCase, this._payInsuranceBiddingAdverticseUseCase)
      : super(BiddingDetailsInitial());

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

  Future<void> buyBidding() async {
    emit(BuyBiddingLoadingState());
    await _buyBiddingAdverticseUseCase
        .execude(directSellingDataModel!.id.toString())
        .then((value) => value.fold((l) => emit(BuyBiddingErrorState(l.message)), (r) {
              emit(BuyBiddingSuccessState(r));
            }));
  }

  final TextEditingController valueController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> bid() async {
    emit(BidBiddingLoadingState());
    await _bidBiddingAdverticseUseCase
        .execude(directSellingDataModel!.id.toString(), valueController.text)
        .then((value) => value.fold((l) => emit(BidBiddingErrorState(l.message)), (r) {
              emit(BidBiddingSuccessState(r));
            }));
  }

  Future<void> payInsurance() async {
    emit(PayInsuranceBiddingLoadingState());
    await _payInsuranceBiddingAdverticseUseCase
        .execude(directSellingDataModel!.id.toString())
        .then((value) => value.fold((l) => emit(PayInsuranceBiddingErrorState(l.message)), (r) {
              emit(PayInsuranceBiddingSuccessState(r));
            }));
  }
}
