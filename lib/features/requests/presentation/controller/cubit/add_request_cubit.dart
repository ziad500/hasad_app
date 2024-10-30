import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/pick_images_widget.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';
import 'package:hasad_app/features/requests/domain/use_cases/add_request_usecase.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:hasad_app/features/requests/domain/use_cases/edit_request_usecase.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_department_request.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_of_agriculture_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_of_packaging.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_of_product.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/choose_type_request.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/more_details.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/price_including_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/select_harvest_date_screen.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/upload_images_screen.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'package:image_picker/image_picker.dart';

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  final AddRequestUseCase _addRequestUseCase;
  final EditRequestUseCase _editRequestUseCase;
  AddRequestCubit(this._addRequestUseCase, this._editRequestUseCase)
      : super(AddRequestInitial());
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
    DoneRequestScreen(
      donePageState: DonePageState.waiting,
      title: "${LocaleKeys.thankYou.tr()} ،",
      subTitle: LocaleKeys.weWillReviewAndInsertYourAdvertisement.tr(),
      route: Routes.homeScreenRoutes,
    )
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
  int? selectedQuantityType = 1;
  void selectedQuantityTypeFunc(int value) {
    selectedQuantityType = value;
    emit(SelectQuantityTypeState());
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
  final TextEditingController quantityController = TextEditingController();

  String? selectedbiddingDate;
  void selectbiddingDate(String value) {
    selectedbiddingDate = value;
    emit(SelectBiddingDateState());
  }

  ////////////////////////////// add request //////////////////////////
  Future addRequest() async {
    emit(AddRequestLoadingState());
    await _addRequestUseCase.execude(_passAddRequestRequest()).then((value) =>
        value.fold((l) => emit(AddRequestErrorState(l.message)),
            (r) => emit(AddRequestSuccessState())));
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
      biddingDuration:
          biddingLongController.text == "" ? null : biddingLongController.text,
      biddingdate: selectedbiddingDate,
      startingPrice:
          startPriceController.text == "" ? null : startPriceController.text,
      type: selectedType == 1 ? selectedQuantityType.toString() : "2",
      mainQuantity: selectedType == 1
          ? selectedQuantityType == 1
              ? quantityController.text
              : "1"
          : "1");

  ////////////////////////////// edit request //////////////////////////
  Future editRequest(String id) async {
    emit(EditRequestLoadingState());
    await _editRequestUseCase.execude(_passEditRequestRequest(id)).then(
        (value) => value.fold((l) => emit(EditRequestErrorState(l.message)),
            (r) => emit(EditRequestSuccessState(LocaleKeys.doneEdited.tr()))));
  }

  EditRequestRequest _passEditRequestRequest(String id) => EditRequestRequest(
      advertisementId: id,
      advertisementTypeId: selectedType.toString(),
      departmentId: selectedDepartment.toString(),
      departmentTypeId: selectedTypeOfProduct.toString(),
      priceInclusionIds: selectedPriceIncluding,
      agricultureTypeId: selectedagriculture.toString(),
      packagingTypeId: selectedPackaging.toString(),
      harvestDate: convertDateFormat(selectedHarvestDate.toString()),
      images: images.isEmpty ? null : images.map((e) => File(e.path)).toList(),
      video: isNetworkImage(videoPath ?? "") ? null : File(videoPath!),
      title: titleController.text,
      description: descriptionController.text,
      regionId: cityController.text,
      cityId: provinceController.text,
      districtId: districtController.text,
      price: defaultPriceController.text,
      biddingDuration:
          biddingLongController.text == "" ? null : biddingLongController.text,
      biddingdate: selectedbiddingDate,
      startingPrice:
          startPriceController.text == "" ? null : startPriceController.text,
      deletedImages: deletedImages,
      type: selectedQuantityType.toString(),
      mainQuantity: selectedQuantityType == 1 ? quantityController.text : "1");

  List<LocationModel> imagesFromResponse = [];
  List<String> deletedImages = [];

  String? editId;
  setController(DirectSellingDataModel? directSellingDataModel) {
    if (directSellingDataModel != null) {
      // ignore: prefer_null_aware_operators
      editId = directSellingDataModel.id == null
          ? null
          : directSellingDataModel.id.toString();
      selectedType = directSellingDataModel.advertisementType?.id;
      selectedDepartment = directSellingDataModel.department?.id;
      selectedTypeOfProduct = directSellingDataModel.departmentType?.id;
      selectedPriceIncluding = directSellingDataModel.priceInclusions!
          .map((e) => e.id.toString())
          .toList();
      selectedagriculture =
          directSellingDataModel.agricultureType?.id.toString();
      selectedPackaging = directSellingDataModel.packagingType?.id.toString();
      selectedHarvestDate = directSellingDataModel.harvestDate;
      titleController.text = directSellingDataModel.title ?? "";
      descriptionController.text = directSellingDataModel.description ?? "";
      cityController.text = directSellingDataModel.region!.id.toString();
      provinceController.text = directSellingDataModel.city!.id.toString();
      districtController.text = directSellingDataModel.district!.id.toString();
      startPriceController.text = directSellingDataModel.auctionPrice == null
          ? ""
          : directSellingDataModel.auctionPrice.toString();
      defaultPriceController.text = directSellingDataModel.price == null
          ? directSellingDataModel.auctionPrice.toString()
          : directSellingDataModel.price.toString();
      videoPath = directSellingDataModel.video;
      biddingLongController.text =
          directSellingDataModel.biddingDuration == null
              ? ""
              : directSellingDataModel.biddingDuration.toString();
      imagesFromResponse = directSellingDataModel.images ?? [];
      selectedbiddingDate = directSellingDataModel.biddingDate
          ?.replaceAll("AM", "")
          .replaceAll("PM", "");
      selectedQuantityType = int.parse(directSellingDataModel.type.toString());
      quantityController.text = directSellingDataModel.mainQuantity == null
          ? ""
          : directSellingDataModel.mainQuantity.toString();
    } else {
      editId = null;
    }
  }
}
