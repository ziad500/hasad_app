import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';
import 'package:hasad_app/features/categories/domain/use_cases/get_categories_types_usecase.dart';
import 'package:hasad_app/features/categories/domain/use_cases/get_categories_usecase.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesTypesUseCase _getCategoriesTypesUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoriesCubit(this._getCategoriesTypesUseCase, this._getCategoriesUseCase)
      : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<CategoryListModel> categories = [];
  Future getCategories() async {
    emit(GetCategoriesLoadingState());
    await _getCategoriesUseCase
        .execude()
        .then((value) => value.fold((l) => emit(GetCategoriesErrorState(l.message)), (r) {
              categories = r.data ?? [];
              emit(GetCategoriesSuccessState());
            }));
  }

  List<CategoryListModel> categoriesTypes = [];
  Future getCategoriesTypes(String categoryId) async {
    emit(GetCategoriesTypesLoadingState());
    await _getCategoriesTypesUseCase
        .execude(categoryId)
        .then((value) => value.fold((l) => emit(GetCategoriesTypesErrorState(l.message)), (r) {
              categoriesTypes = r.data ?? [];
              emit(GetCategoriesTypesSuccessState());
            }));
  }
}
