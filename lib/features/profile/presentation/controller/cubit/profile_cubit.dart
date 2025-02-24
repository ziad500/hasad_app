import 'dart:io';

import 'package:hasad_app/features/profile/domain/use_cases/change_password_usecase.dart';
import 'package:hasad_app/features/profile/domain/use_cases/get_app_settings_usecase.dart';

import '../../../data/network/requests.dart';
import '../../../domain/use_cases/edit_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/models/profile_model.dart';
import '../../../domain/use_cases/get_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final EditProfileUseCase editProfileUseCase;
  final GetAppSettingsUseCase getAppSettingsUseCase;

  final ChangePasswordUseCase changePasswordUseCase;
  ProfileCubit(this.getProfileUseCase, this.editProfileUseCase, this.changePasswordUseCase,
      this.getAppSettingsUseCase)
      : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  ProfileDataModel? profileDataModel;

  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    await getProfileUseCase.execude().then((value) => value.fold((l) {
          emit(GetProfileDataErrorState(l.message));
        }, (r) {
          profileDataModel = r.data;
          setController();
          emit(GetProfileDataSuccessState());
        }));
  }

  Future<void> editProfileData() async {
    emit(EditProfileDataLoadingState());
    await editProfileUseCase.execude(_passEditProfileRequest()).then((value) => value.fold((l) {
          emit(EditProfileDataErrorState(l.message));
        }, (r) {
          profileDataModel = r.data;
          emit(EditProfileDataSuccessState());
        }));
  }

  EditProfileRequest _passEditProfileRequest() => EditProfileRequest(
      name: nameController.text,
      image: profileImage,
      phone: phoneController.text,
      stc: stcController.text);

  File? profileImage;

  Future uploadImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        profileImage = File(value.path);
        emit(UploadProfileImageSuccess());
      }
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController stcController = TextEditingController();
  final TextEditingController passwordhintController =
      TextEditingController(text: "**************");

  void setController() {
    nameController.text = profileDataModel?.name ?? "";
    phoneController.text = profileDataModel?.phone != null
        ? !profileDataModel!.phone!.toString().startsWith("0")
            ? "0${profileDataModel?.phone.toString() ?? ""}"
            : profileDataModel?.phone.toString() ?? ""
        : "";
    stcController.text = profileDataModel?.stc != null
        ? !profileDataModel!.stc!.toString().startsWith("0")
            ? "0${profileDataModel?.stc.toString() ?? ""}"
            : profileDataModel?.stc.toString() ?? ""
        : "";
  }

  SettingsDataModel? settingsDataModel;
  Future<void> getAppSettings() async {
    emit(GetAppSettingsDataLoadingState());
    await getAppSettingsUseCase.execude().then((value) => value.fold((l) {
          emit(GetAppSettingsDataErrorState(l.message));
        }, (r) {
          print(".... ${r.data?.auctionRateIncrement}");
          settingsDataModel = r.data;
          emit(GetAppSettingsDataSuccessState());
        }));
  }
}
