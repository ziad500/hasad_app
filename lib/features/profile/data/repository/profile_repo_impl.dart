import '../network/requests.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../core/failure.dart';
import '../../domain/models/profile_model.dart';
import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_remote_data_source.dart';
import '../mapper/profile_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(this._profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final response = await _profileRemoteDataSource.getProfile();
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
  Future<Either<Failure, ProfileModel>> editProfile(EditProfileRequest editProfileRequest) async {
    try {
      final response = await _profileRemoteDataSource.editProfile(editProfileRequest);
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
  Future<Either<Failure, dynamic>> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    try {
      final response = await _profileRemoteDataSource.changePassword(changePasswordRequest);
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
  Future<Either<Failure, SettingsModel>> getAppSettings() async {
    try {
      final response = await _profileRemoteDataSource.getAppSettings();
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
