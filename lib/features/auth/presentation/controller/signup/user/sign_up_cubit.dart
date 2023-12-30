import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/cache_helper.dart';
import '../../../../../../../utils/cache_keys.dart';
import '../../../../data/network/auth_requests.dart';
import '../../../../domain/models/login_model.dart';
import '../../../../domain/usecase/user_signup_usecase.dart';

part 'sign_up_state.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {
  final UserSignUpUseCase userSignUpUseCase;

  UserSignUpCubit(this.userSignUpUseCase) : super(SignUpInitial());

  static UserSignUpCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

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

  Future<void> userSignup(UserSignUpRequest userSignUpRequest) async {
    emit(UserSignUpLoadingState());
    await userSignUpUseCase.execude(userSignUpRequest).then((value) => value.fold((l) {
          emit(UserSignUpErrorState(l.message));
        }, (r) {
          //save password in cache
          CacheHelper.saveData(key: CacheKeys.password, value: userSignUpRequest.password);
          //save credentials
          saveCredentials(r);

          emit(UserSignUpSuccessState());
        }));
  }

  void saveCredentials(MainUserAuthModel mainUserAuthModel) {
    //save token in cache
    CacheHelper.saveData(key: CacheKeys.token, value: mainUserAuthModel.data?.token ?? "")
        .then((value) {
      //set token value
      Constants.token = CacheHelper.getData(key: CacheKeys.token);
    });
    //save refresh token in cache
  }
}
