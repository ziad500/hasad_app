import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/buy_order_after_win_usecase.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/confirm_order_bidding_usecase.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/confirm_order_usecase_otp.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/get_bidding_orders_usecase.dart';

part 'bidding_orders_state.dart';

class BiddingOrdersCubit extends Cubit<BiddingOrdersState> {
  final GetBiddingOrdersListUseCase _getBiddingOrdersListUseCase;
  final BuyOrderAfterWinOrderUseCase _buyOrderAfterWinOrderUseCase;
  final ConfirmBiddingOrderUseCase _confirmOrderUseCase;
  final BiddingConfirmOrderByCodeUseCase biddingConfirmOrderByCodeUseCase;
  BiddingOrdersCubit(this._getBiddingOrdersListUseCase, this._buyOrderAfterWinOrderUseCase,
      this._confirmOrderUseCase, this.biddingConfirmOrderByCodeUseCase)
      : super(BiddingOrdersOrdersInitial());
  static BiddingOrdersCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  BiddingOrdersListModel? biddingOrdersListModel;
  List<BiddingOrderModel> directSellingOrders = [];
  Future<void> getBiddingList() async {
    if (_canFetchMore() || biddingOrdersListModel == null) {
      _emitLoadingState();
      await _getBiddingOrdersListUseCase.execude(getPageNumber() ?? "1").then((value) => value.fold(
          (l) => emit(GetBiddingOrdersListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetBiddingOrdersListSuccessState());
    if (biddingOrdersListModel?.pagination?.nextPageUrl == null) {
      emit(BiddingOrdersListAllCaughtState());
    }
  }

  void _handleSuccessState(BiddingOrdersListModel response) {
    if (biddingOrdersListModel == null) {
      directSellingOrders = response.data ?? [];
      biddingOrdersListModel = response;
    } else {
      directSellingOrders.addAll(response.data ?? []);
      biddingOrdersListModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (biddingOrdersListModel == null) {
      emit(GetBiddingOrdersListLoadingState());
    } else {
      emit(GetBiddingOrdersListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! BiddingOrdersListAllCaughtState;

  String? getPageNumber() {
    String? nextPageNumber = biddingOrdersListModel?.pagination?.nextPageUrl
        ?.split('?')
        .firstWhere((element) => element.contains("page"));
    try {
      nextPageNumber = nextPageNumber!.split("=").last;
    } catch (_) {
      nextPageNumber = "1";
    }
    return nextPageNumber;
  }

  Future<void> buyOrderAfterWin(String purchaseInvoiceId) async {
    emit(BuyOrderAfterWinLoadingState());
    await _buyOrderAfterWinOrderUseCase.execude(purchaseInvoiceId).then((value) => value.fold(
        (l) => emit(BuyOrderAfterWinErrorState(l.message)),
        (r) => emit(BuyOrderAfterWinSuccessState())));
  }

  Future<void> confirmOrder(String purchaseInvoiceId, String? isReceived, String? reason) async {
    emit(ConfirmBiddingOrderLoadingState());
    await _confirmOrderUseCase.execude(purchaseInvoiceId, isReceived, reason).then((value) =>
        value.fold((l) => emit(ConfirmOrderErrorState(l.message, isReceived == "3")),
            (r) => emit(ConfirmOrderSuccessState(isReceived == "3"))));
  }

  Future<void> authConfirmOrder(String purchaseInvoiceId, String confirmationcode) async {
    emit(AuthConfirmOrderLoadingState());
    await biddingConfirmOrderByCodeUseCase
        .execude(purchaseInvoiceId, confirmationcode)
        .then((value) => value.fold((l) => emit(AuthConfirmOrderErrorState(l.message)), (r) {
              emit(AuthConfirmOrderSuccessState());
            }));
  }
}
