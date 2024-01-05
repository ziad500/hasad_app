import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';
import 'package:hasad_app/features/requests/domain/use_cases/add_request_usecase.dart';
import 'package:hasad_app/features/requests/presentation/components/base/done_request_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_department_request.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_of_agriculture_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_of_packaging.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_of_product.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_request.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/more_details.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/price_including_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/select_harvest_date_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/upload_images_screen.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:image_picker/image_picker.dart';

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  final AddRequestUseCase _addRequestUseCase;
  AddRequestCubit(this._addRequestUseCase) : super(AddRequestInitial());
  static AddRequestCubit get(context) => BlocProvider.of(context);

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  int pageNumber = 0;
  void changepageViewIndex(int index) {
    pageNumber = index;
    emit(ChangePAgeViewIndexState());
  }

  List<Widget> screens = [
    const ChooseTypeOfRequest(),
    const ChooseDepartmentRequestScreen(),
    const ChooseTypeOfProductScreen(),
    const PriceIncludingScreen(),
    const TypeOfAgricultureScreen(),
    const TypeOfPackagingScreen(),
    const SelectHarvestDateScreen(),
    const UploadImagesScreen(),
    const MoreDetailsScreen(),
    const DoneRequestScreen()
  ];

  PageController pageController = PageController();

  //////////// 1 //////////////
  int? selectedType = 1;
  void selectType(int value) {
    selectedType = value;
    emit(SelectTypeState());
  }

  //////////// 2 //////////////
  int? selectedDepartment;
  void selectDepartment(int value) {
    selectedDepartment = value;
    emit(SelectDepartmentState());
  }

  //////////// 3 //////////////
  int? selectedTypeOfProduct;
  void selectTypeOfProduct(int value) {
    selectedTypeOfProduct = value;
    emit(SelectTypeOfProductState());
  }

  //////////// 4 //////////////
  List<String> selectedPriceIncluding = [];
  void selectPriceIncluding(String value) {
    if (!selectedPriceIncluding.contains(value)) {
      selectedPriceIncluding.add(value);
    } else {
      selectedPriceIncluding.remove(value);
    }
    emit(SelectPriceIncludingState());
  }

  //////////// 5 //////////////
  String? selectedagriculture;
  void selectagriculture(String value) {
    selectedagriculture = value;
    emit(SelectAgricultureState());
  }

  //////////// 6 //////////////
  String? selectedPackaging;
  void selectPackaging(String value) {
    selectedPackaging = value;
    emit(SelectPackagingState());
  }

  //////////// 7 //////////////
  String? selectedHarvestDate;
  void selectHarvestDate(String value) {
    selectedHarvestDate = value;
    emit(SelectHarvestDateState());
  }

  //////////// 8 //////////////
  List<XFile> images = [];
  String? videoPath;
  //////////// 9 //////////////
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController startPriceController = TextEditingController();
  final TextEditingController defaultPriceController = TextEditingController();
  final TextEditingController biddingLongController = TextEditingController();
  String? selectedbiddingDate;
  void selectbiddingDate(String value) {
    selectedbiddingDate = value;
    emit(SelectBiddingDateState());
  }

  ////////////////////////////// add request //////////////////////////
  Future addRequest() async {
    emit(AddRequestLoadingState());
    await _addRequestUseCase.execude(_passAddRequestRequest()).then((value) => value.fold(
        (l) => emit(AddRequestErrorState(l.message)), (r) => emit(AddRequestSuccessState())));
  }

  AddRequestRequest _passAddRequestRequest() => AddRequestRequest(
      advertisementTypeId: selectedType.toString(),
      departmentId: selectedDepartment.toString(),
      departmentTypeId: selectedTypeOfProduct.toString(),
      priceInclusionIds: selectedPriceIncluding,
      agricultureTypeId: selectedagriculture.toString(),
      packagingTypeId: selectedPackaging.toString(),
      harvestDate: convertDateFormat(selectedHarvestDate.toString()),
      images: images.map((e) => File(e.path)).toList(),
      video: File(videoPath!),
      title: titleController.text,
      description: descriptionController.text,
      regionId: cityController.text,
      cityId: provinceController.text,
      districtId: districtController.text,
      price: defaultPriceController.text,
      biddingDuration: biddingLongController.text == "" ? null : biddingLongController.text,
      biddingdate: selectedbiddingDate != null ? convertDateFormat(selectedbiddingDate!) : null,
      startingPrice: startPriceController.text == "" ? null : startPriceController.text);
}
