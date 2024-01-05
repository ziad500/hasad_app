part of 'categories_cubit.dart';

sealed class CategoriesState {
  const CategoriesState();
}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoriesLoadingState extends CategoriesState {}

final class GetCategoriesSuccessState extends CategoriesState {}

final class GetCategoriesErrorState extends CategoriesState {
  final String error;
  GetCategoriesErrorState(this.error);
}

final class GetCategoriesTypesLoadingState extends CategoriesState {}

final class GetCategoriesTypesSuccessState extends CategoriesState {}

final class GetCategoriesTypesErrorState extends CategoriesState {
  final String error;
  GetCategoriesTypesErrorState(this.error);
}
