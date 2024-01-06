import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_direct_selling_list_usecase.dart';

part 'direct_selling_list_dart_state.dart';

class DirectSellingListCubit extends Cubit<DirectSellingListState> {
  final GetDirectSellingListUseCase _getDirectSellingListUseCase;
  DirectSellingListCubit(this._getDirectSellingListUseCase) : super(DirectSellingListDartInitial());
  static DirectSellingListCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

//////////////////////////// all direct selling list //////////////////////////////
  GetMainListRequest getMainListRequest = GetMainListRequest();
  DirectSellingListModel? directSellingListModel;
  List<DirectSellingDataModel> allDirectSelling = [];
  String page = "1";
  Future<void> getDirectSellingList() async {
    if (_canFetchMore()) {
      getMainListRequest.page = getPageNumber();
      _emitLoadingState();
      await _getDirectSellingListUseCase.execude(getMainListRequest).then((value) => value.fold(
          (l) => emit(GetDirectSellingListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetDirectSellingListSuccessState());
    if (directSellingListModel?.pagination?.nextPageUrl == null) {
      emit(DirectSellingListAllCaughtState());
    }
  }

  void _handleSuccessState(DirectSellingListModel response) {
    if (directSellingListModel == null) {
      allDirectSelling = response.data ?? [];
      directSellingListModel = response;
    } else {
      allDirectSelling.addAll(response.data ?? []);
      directSellingListModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (directSellingListModel == null) {
      emit(GetDirectSellingListLoadingState());
    } else {
      emit(GetDirectSellingListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! DirectSellingListAllCaughtState;

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

  //////////////////////////// my direct selling list //////////////////////////////
}
