part of 'item_details_cubit.dart';

sealed class ItemDetailsState {
  const ItemDetailsState();
}

final class ItemDetailsInitial extends ItemDetailsState {}

final class ChangeIndexSliderstate extends ItemDetailsState {}
