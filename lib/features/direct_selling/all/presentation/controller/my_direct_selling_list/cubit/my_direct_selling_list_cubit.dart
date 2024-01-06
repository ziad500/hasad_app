import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_my_direct_selling_list_usecase.dart';

part 'my_direct_selling_list_state.dart';

class MyDirectSellingListCubit extends Cubit<MyDirectSellingListState> {
  final GetMyDirectSellingListUseCase _myDirectSellingListUseCase;
  MyDirectSellingListCubit(this._myDirectSellingListUseCase) : super(MyDirectSellingListInitial());
  static MyDirectSellingListCubit get(context) => BlocProvider.of(context);

  DirectSellingListModel? directSellingListModel;
  List<DirectSellingDataModel> myDirectSelling = [];
  Future<void> getDirectSellingList() async {
    if (_canFetchMore()) {
      _emitLoadingState();
      await _myDirectSellingListUseCase.execude(getPageNumber() ?? "1").then((value) => value.fold(
          (l) => emit(MyGetDirectSellingListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(MyGetDirectSellingListSuccessState());
    if (directSellingListModel?.pagination?.nextPageUrl == null) {
      emit(MyDirectSellingListAllCaughtState());
    }
  }

  void _handleSuccessState(DirectSellingListModel response) {
    if (directSellingListModel == null) {
      myDirectSelling = response.data ?? [];
      directSellingListModel = response;
    } else {
      myDirectSelling.addAll(response.data ?? []);
      directSellingListModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (directSellingListModel == null) {
      emit(MyGetDirectSellingListLoadingState());
    } else {
      emit(MyGetDirectSellingListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! MyDirectSellingListAllCaughtState;

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
