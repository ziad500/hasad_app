import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hasad_app/core/responses/success_response.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../core/failure.dart';
import '../../domain/Repository/auth_repo.dart';
import '../../domain/models/login_model.dart';
import '../data_source.dart/auth_remote_data_source.dart';
import '../mapper/auth_mapper.dart';
import '../network/auth_requests.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, dynamic>> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    try {
      final response = await _authRemoteDataSource.resetPassword(resetPasswordRequest);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> verifyOtp(VerifyOtpRequest verifyOtpRequest) async {
    try {
      final response = await _authRemoteDataSource.verifyOtp(verifyOtpRequest);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> requestChangePassword(
      RequestChangePasswordRequest requestChangePasswordRequest) async {
    try {
      final response =
          await _authRemoteDataSource.requestChangePassword(requestChangePasswordRequest);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MainUserAuthModel>> userLogin(LoginRequest loginRequest) async {
    try {
      final response = await _authRemoteDataSource.userLogin(loginRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SuccessModel>> userSignUp(UserSignUpRequest userSignUpRequest) async {
    try {
      final response = await _authRemoteDataSource.userSignUp(userSignUpRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MainUserAuthModel>> verifySignupCode(
      VerifyOtpRequest verifyOtpRequest) async {
    try {
      final response = await _authRemoteDataSource.verifySignupCode(verifyOtpRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }
}
