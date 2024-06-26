import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/auth/domain/usecase/delete_account_usecase.dart';
import 'package:hasad_app/features/auth/domain/usecase/logout_usecase.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/cache_helper.dart';
import '../../../../../../utils/cache_keys.dart';
import '../../../data/network/auth_requests.dart';
import '../../../domain/models/login_model.dart';
import '../../../domain/usecase/user_login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase userLoginUseCase;
  final LogoutUseCase logoutUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  LoginCubit(this.userLoginUseCase, this.logoutUseCase, this.deleteAccountUseCase)
      : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  int userType = 0;
  void changeUserType(int index) {
    userType = index;
    emit(ChangeUSerTypeState());
  }

  //suffix password form field
  Icon suffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.iconColor,
  );

  bool obscured = true;
  //function to toggle between password icon
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

  Future<void> login(LoginRequest loginRequest) async {
    userLogin(loginRequest);
  }

  Future<void> userLogin(LoginRequest input) async {
    emit(LoginLoadingState());
    await userLoginUseCase.execude(input).then((value) => value.fold((l) {
          emit(LoginErrorState(l.message));
        }, (r) {
          //save password in cache
          CacheHelper.saveData(key: CacheKeys.password, value: input.password);
          //save credentials
          saveCredentials(r);

          emit(UserLoginSuccessState());
        }));
  }

  void saveCredentials(MainUserAuthModel loginModel) {
    CacheHelper.saveData(key: CacheKeys.userId, value: loginModel.data?.user?.id.toString() ?? "")
        .then((value) {
      //set token value
      Constants.userId = CacheHelper.getData(key: CacheKeys.userId);
    });
    //save token in cache
    CacheHelper.saveData(key: CacheKeys.token, value: loginModel.data?.token ?? "").then((value) {
      //set token value
      Constants.token = CacheHelper.getData(key: CacheKeys.token);
    });
    //save refresh token in cache
  }

  Future<void> userLogOut(LogOutRequest logOutRequest) async {
    emit(LogoutLoadingState());
    await logoutUseCase.execude(logOutRequest).then((value) => value.fold((l) {
          emit(LogoutErrorState(l.message));
        }, (r) {
          CacheHelper.removeData(key: CacheKeys.fcmId);
          CacheHelper.removeData(key: CacheKeys.token);
          CacheHelper.removeData(key: CacheKeys.userId);
          CacheHelper.removeData(key: CacheKeys.refreshToken);
          CacheHelper.removeData(key: CacheKeys.password);

          emit(UserLogoutSuccessState());
        }));
  }

  Future<void> deleteAccount() async {
    emit(UserDeleteLoadingState());
    await deleteAccountUseCase.execude().then((value) => value.fold((l) {
          emit(UserDeleteErrorState(l.message));
        }, (r) {
          CacheHelper.removeData(key: CacheKeys.fcmId);
          CacheHelper.removeData(key: CacheKeys.token);
          CacheHelper.removeData(key: CacheKeys.userId);
          CacheHelper.removeData(key: CacheKeys.refreshToken);
          CacheHelper.removeData(key: CacheKeys.password);
          emit(UserDeleteSuccessState());
        }));
  }
}
