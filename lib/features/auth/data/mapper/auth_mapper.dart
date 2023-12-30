import '../../domain/models/login_model.dart';
import '../../domain/models/sign_up_model.dart';
import '../responses/auth_response.dart';

extension MainUserAuthResponseMapper on MainUserAuthResponse? {
  MainUserAuthModel toDomain() {
    return MainUserAuthModel(this?.status, this?.message, this?.data.toDomain());
  }
}

extension UserDataMapper on UserData? {
  UserDataModel toDomain() {
    return UserDataModel(this?.token, this?.user.toDomain());
  }
}

extension UserMapper on User? {
  UserModel toDomain() {
    return UserModel(
        this?.firstName,
        this?.lastName,
        this?.email,
        this?.phoneKey,
        this?.phoneNumber,
        this?.region,
        this?.city,
        this?.district,
        this?.addressDetails,
        this?.photo);
  }
}

extension InespectorSignUpResponseMapper on InespectorSignUpResponse? {
  InespectorSignUpModel toDomain() {
    return InespectorSignUpModel(this?.status, this?.message);
  }
}
