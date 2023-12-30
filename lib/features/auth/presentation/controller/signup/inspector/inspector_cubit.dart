/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../data/network/auth_requests.dart';
import '../../../../domain/usecase/inspector_signup_usecase.dart';
import '../../../screens/sign_up/inspector/components/account_information.dart';
import '../../../screens/sign_up/inspector/components/done_screen.dart';
import '../../../screens/sign_up/inspector/components/examination_types.dart';
import '../../../screens/sign_up/inspector/components/file_upload.dart';
import '../../../screens/sign_up/inspector/components/payment_info.dart';
import '../../../screens/sign_up/inspector/components/product_types.dart';
import '../../../screens/sign_up/inspector/components/service_location.dart';

part 'inspector_state.dart';

class InspectorSignUpCubit extends Cubit<InspectorSignUpState> {
  final IncpectorSignUpUseCase incpectorSignUpUseCase;

  InspectorSignUpCubit(this.incpectorSignUpUseCase) : super(InspectorInitial());

  static InspectorSignUpCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  //text editing controller
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController identityNumberController = TextEditingController();

  //front image
  String? frontImagePath;
  //back image
  String? backImagePath;
  //profile image
  String? profileImagePath;

  int pageNumber = 0;
  void changepageViewIndex(int index, context) {
    pageNumber = index;
    if (index == 2) {
      /*    departments = [];
      typeOfDepartments = []; */
      ListsCubit.get(context).getDepartmentsList();
    }
    if (index == 3) {
      /*  regions = [];
      cities = [];
      district = []; */
      ListsCubit.get(context).getRegionsList();
    }
    if (index == 4) {
/*       inspectionTypes = [];
 */
      ListsCubit.get(context).getinspectionTypesList();
    }
    emit(ChangePAgeViewIndexState());
  }

  List<Widget> screens = [
    const AccountInformationSignup(),
    const SignUpFileUpload(),
    const SignupProductTypes(),
    const SignupServiceLocation(),
    const SignupExaminationTypes(),
    SignupPaymentInfo(),
    const SignupDoneScreen()
  ];

  PageController pageController = PageController();

  Icon suffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.iconColor,
  );
  bool obscured = true;
  // function to toggle between password icon
  void toggleObscured() {
    obscured = !obscured;

    if (obscured) {
      suffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.iconColor,
      );
    } else {
      suffix = const Icon(
        Icons.visibility_off,
        color: AppColors.iconColor,
      );
    }
    emit(ViewPasswordState());
  }

  Icon confirmSuffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.iconColor,
  );

  bool confirmObscured = true;
  // function to toggle between password icon
  void confirmToggleObscured() {
    confirmObscured = !confirmObscured;

    if (confirmObscured) {
      confirmSuffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.iconColor,
      );
    } else {
      confirmSuffix = const Icon(
        Icons.visibility_off,
        color: AppColors.iconColor,
      );
    }
    emit(ConfirmViewPasswordState());
  }

  Future<void> inspectorSignup(InspectorSignUpRequest inspectorSignUpRequest) async {
    emit(InspectorSignUpLoadingState());
    await incpectorSignUpUseCase.execude(inspectorSignUpRequest).then((value) => value.fold((l) {
          emit(InspectorSignUpErrorState(l.message));
        }, (r) {
          emit(InspectorSignUpSuccessState());
        }));
  }

  // departments list
  List<ListsDataModel> departments = [];
  void addToDepartmentsList(ListsDataModel item) {
    if (!departments.contains(item)) {
      departments.add(item);
      emit(AddToDepartmentsListState());
    }
  }

  void removeFromDepartmentsList(ListsDataModel item) {
    departments.remove(item);
    emit(RemoveFromDepartmentsListState());
  }

// type of departments
  List<ListsDataModel> typeOfDepartments = [];
  void addTotypeOfDepartmentsList(ListsDataModel item) {
    if (!typeOfDepartments.contains(item)) {
      typeOfDepartments.add(item);
      emit(AddToTypeOfDepartmentsListState());
    }
  }

  void removeFromTypeOfDepartmentsList(ListsDataModel item) {
    typeOfDepartments.remove(item);
    emit(RemoveFromTypeOfDepartmentsListState());
  }

  // regions list
  List<ListsDataModel> regions = [];
  void addToRegionsList(ListsDataModel item) {
    if (!regions.contains(item)) {
      regions.add(item);
      emit(AddToRegionsListState());
    }
  }

  void removeFromRegionsList(ListsDataModel item) {
    regions.remove(item);
    emit(RemoveFromRegionsListState());
  }

  void resetCitiesAndDistrict() {
    if (cities.isNotEmpty) {
      cities = [];
      emit(RemoveFromCityListState());
    }
    if (district.isNotEmpty) {
      district = [];
      emit(RemoveFromDistrictListState());
    }
  }

// cities list
  List<ListsDataModel> cities = [];
  void addToCityList(ListsDataModel item) {
    if (!cities.contains(item)) {
      cities.add(item);
      emit(AddToCityListState());
    }
  }

  void removeFromCityList(ListsDataModel item) {
    cities.remove(item);
    emit(RemoveFromCityListState());
  }

  // District list
  List<ListsDataModel> district = [];
  void addToDistrictList(ListsDataModel item) {
    if (!district.contains(item)) {
      district.add(item);
      emit(AddToDistrictListState());
    }
  }

  void removeFromDistrictList(ListsDataModel item) {
    district.remove(item);
    emit(RemoveFromDistrictListState());
  }

  // inspection types list
  List<ListsDataModel> inspectionTypes = [];
  void addToInspectionTypesList(ListsDataModel item) {
    if (!inspectionTypes.contains(item)) {
      inspectionTypes.add(item);
      emit(AddToInspectionTypesListState());
    }
  }

  void removeFromInspectionTypesList(ListsDataModel item) {
    inspectionTypes.remove(item);
    emit(RemoveFromInspectionTypesListState());
  }
}
 */