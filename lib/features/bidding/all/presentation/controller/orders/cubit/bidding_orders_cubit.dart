/* import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_direct_selling_orders_usecase.dart';

part 'bidding_orders_state.dart';

class BiddingOrdersCubit extends Cubit<BiddingOrdersState> {
  final GetBiddingOrdersListUseCase _getBiddingOrdersListUseCase;
  BiddingOrdersCubit(this._getBiddingOrdersListUseCase) : super(BiddingOrdersOrdersInitial());
  static BiddingOrdersCubit get(context) => BlocProvider.of(context);

  BiddingOrdersListModel? directSellingOrdersListModel;
  List<BiddingOrderModel> directSellingOrders = [];
  Future<void> getBiddingList() async {
    if (_canFetchMore()) {
      _emitLoadingState();
      await _getBiddingOrdersListUseCase.execude(getPageNumber() ?? "1").then((value) => value.fold(
          (l) => emit(GetBiddingOrdersListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetBiddingOrdersListSuccessState());
    if (directSellingOrdersListModel?.pagination?.nextPageUrl == null) {
      emit(BiddingOrdersListAllCaughtState());
    }
  }

  void _handleSuccessState(BiddingOrdersListModel response) {
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
      emit(GetBiddingOrdersListLoadingState());
    } else {
      emit(GetBiddingOrdersListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! BiddingOrdersListAllCaughtState;

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
}
 */