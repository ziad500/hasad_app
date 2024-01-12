import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/profile/data/network/requests.dart';
import 'package:hasad_app/features/profile/domain/use_cases/change_password_usecase.dart';
import 'package:hasad_app/utils/app_colors.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit(this.changePasswordUseCase) : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Icon oldSuffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.grey,
  );

  bool oldObscured = true;
  // function to toggle between password icon
  void toggleOldObscured() {
    oldObscured = !oldObscured;

    if (oldObscured) {
      oldSuffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.grey,
      );
    } else {
      oldSuffix = const Icon(
        Icons.visibility_off,
        color: AppColors.grey,
      );
    }
    emit(OldViewPasswordState());
  }

  Icon suffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.grey,
  );
  bool obscured = true;
  // function to toggle between password icon
  void toggleObscured() {
    obscured = !obscured;

    if (obscured) {
      suffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.grey,
      );
    } else {
      suffix = const Icon(
        Icons.visibility_off,
        color: AppColors.grey,
      );
    }
    emit(ViewPasswordState());
  }

  Icon confirmSuffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.grey,
  );

  bool confirmObscured = true;
  // function to toggle between password icon
  void confirmToggleObscured() {
    confirmObscured = !confirmObscured;

    if (confirmObscured) {
      confirmSuffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.grey,
      );
    } else {
      confirmSuffix = const Icon(
        Icons.visibility_off,
        color: AppColors.grey,
      );
    }
    emit(ConfirmViewPasswordState());
  }

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();

  Future<void> changePassword() async {
    emit(ChangePasswordLoadingState());
    await changePasswordUseCase.execude(_passChangePasswordRequest()).then((value) => value.fold(
        (l) => emit(ChangePasswordErrorState(l.message)),
        (r) => emit(ChangePasswordSuccessState())));
  }

  ChangePasswordRequest _passChangePasswordRequest() => ChangePasswordRequest(
      oldPassword: oldPasswordController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text);
}
