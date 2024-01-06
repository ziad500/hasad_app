import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/get_my_bidding_list_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

part 'my_bidding_list_state.dart';

class MyBiddingListCubit extends Cubit<MyBiddingListState> {
  final GetMyBiddingListUseCase _myBiddingListUseCase;
  MyBiddingListCubit(this._myBiddingListUseCase) : super(MyBiddingListInitial());
  static MyBiddingListCubit get(context) => BlocProvider.of(context);

  DirectSellingListModel? directSellingListModel;
  List<DirectSellingDataModel> myBidding = [];
  Future<void> getBiddingList() async {
    if (_canFetchMore()) {
      _emitLoadingState();
      await _myBiddingListUseCase.execude(getPageNumber() ?? "1").then((value) => value.fold(
          (l) => emit(MyGetBiddingListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(MyGetBiddingListSuccessState());
    if (directSellingListModel?.pagination?.nextPageUrl == null) {
      emit(MyBiddingListAllCaughtState());
    }
  }

  void _handleSuccessState(DirectSellingListModel response) {
    if (directSellingListModel == null) {
      myBidding = response.data ?? [];
      directSellingListModel = response;
    } else {
      myBidding.addAll(response.data ?? []);
      directSellingListModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (directSellingListModel == null) {
      emit(MyGetBiddingListLoadingState());
    } else {
      emit(MyGetBiddingListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! MyBiddingListAllCaughtState;

  String? getPageNumber() {
    String? nextPageNumber = directSellingListModel?.pagination?.nextPageUrl
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
