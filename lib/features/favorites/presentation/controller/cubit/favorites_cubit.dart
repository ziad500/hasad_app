import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/favorites/data/network/requests.dart';
import 'package:hasad_app/features/favorites/domain/use_cases/add_to_favorites_usecase.dart';
import 'package:hasad_app/features/favorites/domain/use_cases/get_favorites_usecase.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesListUseCase _getFavoritesListUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;

  FavoritesCubit(this._getFavoritesListUseCase, this._addToFavoritesUseCase)
      : super(FavoritesInitial());
  static FavoritesCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  DirectSellingListModel? directSellingListModel;
  List<DirectSellingDataModel> allFavorites = [];
  Future<void> getFavoritesList({bool reset = true}) async {
    if (Constants.token != "") {
      if (reset) {
        allFavorites = [];
      }
      _emitLoadingState();
      await _getFavoritesListUseCase.execude(GetFavoritesListReqeust(page: null)).then((value) =>
          value.fold(
              (l) => emit(GetFavoritesListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetFavoritesListSuccessState());
    if (directSellingListModel?.pagination?.nextPageUrl == null) {
      emit(FavoritesListAllCaughtState());
    }
  }

  void _handleSuccessState(DirectSellingListModel response) {
    allFavorites = response.data ?? [];
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (directSellingListModel == null) {
      emit(GetFavoritesListLoadingState());
    } else {
      emit(GetFavoritesListPaginationLoadingState());
    }
  }

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

  inFavList(String id) => allFavorites.any((element) => element.id.toString() == id);

  Future<void> addToFav(DirectSellingDataModel directSellingDataModel) async {
    emit(AddToFavoritesListLoadingState());
    await _addToFavoritesUseCase
        .execude(directSellingDataModel.id.toString())
        .then((value) => value.fold((l) => emit(AddToFavoritesListErrorState(l.message)), (r) {
              if (allFavorites.any((element) => element.id == directSellingDataModel.id)) {
                allFavorites.removeWhere((element) => element.id == directSellingDataModel.id);
              } else {
                allFavorites.add(directSellingDataModel);
              }
              emit(AddToFavoritesListSuccessState());
            }));
  }
}
