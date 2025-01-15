import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/confirm_order_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/confirm_order_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_direct_selling_orders_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/re_complete_payment_usecase.dart';

part 'direct_selling_orders_state.dart';

class DirectSellingOrdersCubit extends Cubit<DirectSellingOrdersState> {
  final GetDirectSellingOrdersListUseCase _getDirectSellingOrdersListUseCase;
  final ConfirmOrderUseCase _confirmOrderUseCase;
  final ReCompletePaymentUsecase _reCompletePaymentUsecase;
  final ConfirmOrderByCodeUseCase _confirmOrderByCodeUseCase;

  DirectSellingOrdersCubit(this._getDirectSellingOrdersListUseCase, this._confirmOrderUseCase,
      this._reCompletePaymentUsecase, this._confirmOrderByCodeUseCase)
      : super(DirectSellingOrdersOrdersInitial());
  static DirectSellingOrdersCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  DirectSellingOrdersListModel? directSellingOrdersListModel;
  List<DirectSellingOrderModel> directSellingOrders = [];
  Future<void> getDirectSellingList() async {
    if (_canFetchMore()) {
      _emitLoadingState();
      await _getDirectSellingOrdersListUseCase.execude(getPageNumber() ?? "1").then((value) =>
          value.fold((l) => emit(GetDirectSellingOrdersListErrorState(l.message)),
              (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetDirectSellingOrdersListSuccessState());
    if (directSellingOrdersListModel?.pagination?.nextPageUrl == null) {
      emit(DirectSellingOrdersListAllCaughtState());
    }
  }

  void _handleSuccessState(DirectSellingOrdersListModel response) {
    if (directSellingOrdersListModel == null) {
      directSellingOrders = response.data ?? [];
      directSellingOrdersListModel = response;
    } else {
      directSellingOrders.addAll(response.data ?? []);
      directSellingOrdersListModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (directSellingOrdersListModel == null) {
      emit(GetDirectSellingOrdersListLoadingState());
    } else {
      emit(GetDirectSellingOrdersListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => /* state is! DirectSellingOrdersListAllCaughtState */
      directSellingOrdersListModel?.pagination?.nextPageUrl != null;

  String? getPageNumber() {
    String? nextPageNumber = directSellingOrdersListModel?.pagination?.nextPageUrl
        ?.split('?')
        .firstWhere((element) => element.contains("page"));
    try {
      nextPageNumber = nextPageNumber!.split("=").last;
    } catch (_) {
      nextPageNumber = "1";
    }
    return nextPageNumber;
  }

  Future<void> confirmOrder(String purchaseInvoiceId) async {
    emit(ConfirmOrderLoadingState());
    await _confirmOrderUseCase.execude(purchaseInvoiceId).then((value) => value.fold(
        (l) => emit(ConfirmOrderErrorState(l.message)), (r) => emit(ConfirmOrderSuccessState())));
  }

  Future<void> authConfirmOrder(String purchaseInvoiceId, String confirmationcode) async {
    emit(AuthConfirmOrderLoadingState());
    await _confirmOrderByCodeUseCase
        .execude(purchaseInvoiceId, confirmationcode)
        .then((value) => value.fold((l) => emit(AuthConfirmOrderErrorState(l.message)), (r) {
              emit(AuthConfirmOrderSuccessState());
            }));
  }

  Future<void> reCompleteOrderPayment(String purchaseInvoiceId, String paymentMethod) async {
    emit(ReCompleteOrderPaymentLoadingState());
    await _reCompletePaymentUsecase
        .execude(purchaseInvoiceId, paymentMethod)
        .then((value) => value.fold((l) => emit(ReCompleteOrderPaymentErrorState(l.message)), (r) {
              paymentMethodResult = r['payment_url'];
              emit(ReCompleteOrderPaymentSuccessState());
            }));
  }

  int? selectedPaymentMethod = 1;
  void selectedPaymentMethodFunc(int value) {
    selectedPaymentMethod = value;
    emit(SelectPaymentMethodState());
  }

  String? paymentMethodResult;
  void setPaymentMethodResult(String value) {
    paymentMethodResult = value;
    emit(SetPaymentMethodResultState());
  }
}
