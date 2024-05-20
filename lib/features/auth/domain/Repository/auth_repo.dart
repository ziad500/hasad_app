import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/responses/success_response.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../models/login_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, MainUserAuthModel>> userLogin(LoginRequest loginRequest);
  Future<Either<Failure, dynamic>> logout(LogOutRequest logOutRequest);
  Future<Either<Failure, dynamic>> deleteAccount();

  Future<Either<Failure, SuccessModel>> userSignUp(UserSignUpRequest userSignUpRequest);
  Future<Either<Failure, MainUserAuthModel>> verifySignupCode(VerifyOtpRequest verifyOtpRequest);
  Future<Either<Failure, SuccessModel>> reSendSignupCode(String phone);

  Future<Either<Failure, dynamic>> requestChangePassword(
      RequestChangePasswordRequest requestChangePasswordRequest);
  Future<Either<Failure, dynamic>> verifyOtp(VerifyOtpRequest verifyOtpRequest);
  Future<Either<Failure, dynamic>> resetPassword(ResetPasswordRequest resetPasswordRequest);
}
