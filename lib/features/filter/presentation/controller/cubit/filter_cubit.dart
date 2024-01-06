import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/utils/date_helper.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  static FilterCubit get(context) => BlocProvider.of(context);

  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  String? agricultureTypeId;
  String? packagingTypeId;

  String? selectedHarvestDate;
  void selectHarvestDate(String value) {
    selectedHarvestDate = value;
    emit(SelectHarvestDateState());
  }

  GetMainListRequest passFilterRequest() => GetMainListRequest(
      agricultureTypeId: agricultureTypeId,
      cityId: provinceController.text == "" ? null : provinceController.text,
      districtId: districtController.text == "" ? null : districtController.text,
      harvestDate: selectedHarvestDate == null ? null : convertDateFormat(selectedHarvestDate!),
      packagingTypeId: packagingTypeId,
      page: "1",
      regionId: cityController.text == "" ? null : cityController.text);
}
