import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';
import 'package:hasad_app/features/sales_order/domain/use_cases/get_sales_orders_usecse.dart';

part 'sales_orders_state.dart';

class SalesOrdersCubit extends Cubit<SalesOrdersState> {
  final GetSalesOrdersUsecse _getSalesOrdersUsecse;
  SalesOrdersCubit(this._getSalesOrdersUsecse) : super(SalesOrdersInitial());
  static SalesOrdersCubit get(context) => BlocProvider.of(context);

  String? page;
  SalesOrdersModel? salesOrdersModel;
  List<SalesOrdersDataModel> allSalesOrders = [];
  Future<void> getSalesOrdersList() async {
    if (_canFetchMore() || salesOrdersModel == null) {
      page = getPageNumber();

      _emitLoadingState();
      await _getSalesOrdersUsecse.execude(page!).then((value) => value.fold(
          (l) => emit(GetSalesOrdersListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetSalesOrdersListSuccessState());
    if (salesOrdersModel?.pagination?.nextPageUrl == null) {
      emit(SalesOrdersListAllCaughtState());
    }
  }

  void _handleSuccessState(SalesOrdersModel response) {
    if (salesOrdersModel == null) {
      allSalesOrders = response.data ?? [];
      salesOrdersModel = response;
    } else {
      allSalesOrders.addAll(response.data ?? []);
      salesOrdersModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (salesOrdersModel == null) {
      emit(GetSalesOrdersListLoadingState());
    } else {
      emit(GetSalesOrdersListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! SalesOrdersListAllCaughtState;

  String? getPageNumber() {
    String? nextPageNumber = salesOrdersModel?.pagination?.nextPageUrl
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
