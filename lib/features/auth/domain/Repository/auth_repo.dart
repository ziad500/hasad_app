import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../models/login_model.dart';
import '../models/sign_up_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, MainUserAuthModel>> inspectorLogin(LoginRequest loginRequest);
  Future<Either<Failure, MainUserAuthModel>> userLogin(LoginRequest loginRequest);

  Future<Either<Failure, InespectorSignUpModel>> inspectorSignUp(
      InspectorSignUpRequest inspectorSignUpRequest);
  Future<Either<Failure, MainUserAuthModel>> userSignUp(UserSignUpRequest userSignUpRequest);

  Future<Either<Failure, dynamic>> requestChangePassword(
      RequestChangePasswordRequest requestChangePasswordRequest);
  Future<Either<Failure, dynamic>> verifyOtp(VerifyOtpRequest verifyOtpRequest);
  Future<Either<Failure, dynamic>> resetPassword(ResetPasswordRequest resetPasswordRequest);
}
