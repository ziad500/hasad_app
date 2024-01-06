part of 'filter_cubit.dart';

sealed class FilterState {
  const FilterState();
}

final class FilterInitial extends FilterState {}

final class SelectHarvestDateState extends FilterState {}
