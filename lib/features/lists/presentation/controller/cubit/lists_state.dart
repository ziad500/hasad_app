part of 'lists_cubit.dart';

class ListsState {}

final class ListsInitial extends ListsState {}

final class GetCitiesLoadingState extends ListsState {}

final class GetCitiesSuccessState extends ListsState {}

final class GetCitiesErrorState extends ListsState {
  final String error;
  GetCitiesErrorState(this.error);
}

final class GetDistrictsLoadingState extends ListsState {}

final class GetDistrictsSuccessState extends ListsState {}

final class GetDistrictsErrorState extends ListsState {
  final String error;
  GetDistrictsErrorState(this.error);
}

final class GetTypesLoadingState extends ListsState {}

final class GetTypesSuccessState extends ListsState {}

final class GetTypesErrorState extends ListsState {
  final String error;
  GetTypesErrorState(this.error);
}

final class GetPlaceTypesLoadingState extends ListsState {}

final class GetPlaceTypesSuccessState extends ListsState {}

final class GetPlaceTypesErrorState extends ListsState {
  final String error;
  GetPlaceTypesErrorState(this.error);
}

final class GetRegionsLoadingState extends ListsState {}

final class GetRegionsSuccessState extends ListsState {}

final class GetRegionsErrorState extends ListsState {
  final String error;
  GetRegionsErrorState(this.error);
}

final class GetDepartmentsLoadingState extends ListsState {}

final class GetDepartmentsSuccessState extends ListsState {}

final class GetDepartmentsErrorState extends ListsState {
  final String error;
  GetDepartmentsErrorState(this.error);
}

final class GetIncpectionTypesLoadingState extends ListsState {}

final class GetIncpectionTypesSuccessState extends ListsState {}

final class GetIncpectionTypesErrorState extends ListsState {
  final String error;
  GetIncpectionTypesErrorState(this.error);
}

final class GetIncpectionIncludesLoadingState extends ListsState {}

final class GetIncpectionIncludesSuccessState extends ListsState {}

final class GetIncpectionIncludesErrorState extends ListsState {
  final String error;
  GetIncpectionIncludesErrorState(this.error);
}
