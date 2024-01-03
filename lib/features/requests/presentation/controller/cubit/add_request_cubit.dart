import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit() : super(AddRequestInitial());
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
  int selectedType = 1;
  void selectType(int value) {
    selectedType = value;
    emit(SelectTypeState());
  }

  //////////// 2 //////////////
  int selectedDepartment = 0;
  void selectDepartment(int value) {
    selectedDepartment = value;
    emit(SelectDepartmentState());
  }

  //////////// 3 //////////////
  int selectedTypeOfProduct = 0;
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
  List<String> selectedagriculture = [];
  void selectagriculture(String value) {
    if (!selectedagriculture.contains(value)) {
      selectedagriculture.add(value);
    } else {
      selectedagriculture.remove(value);
    }
    emit(SelectAgricultureState());
  }

  //////////// 6 //////////////
  List<String> selectedPackaging = [];
  void selectPackaging(String value) {
    if (!selectedPackaging.contains(value)) {
      selectedPackaging.add(value);
    } else {
      selectedPackaging.remove(value);
    }
    emit(SelectPackagingState());
  }

  //////////// 7 //////////////
  String? selectedHarvestDate;
  void selectHarvestDate(String value) {
    selectedHarvestDate = value;
    emit(SelectHarvestDateState());
  }

  //////////// 8 //////////////
  //////////// 9 //////////////
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController biddingPriceController = TextEditingController();
  final TextEditingController defaultPriceController = TextEditingController();
  final TextEditingController biddingLongController = TextEditingController();
  String? selectedbiddingDate;
  void selectbiddingDate(String value) {
    selectedbiddingDate = value;
    emit(SelectBiddingDateState());
  }
}
