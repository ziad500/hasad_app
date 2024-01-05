import '../../domain/models/profile_model.dart';
import '../response/profile_response.dart';

extension ProfileResponseMapper on ProfileResponse? {
  ProfileModel toDomain() {
    return ProfileModel(this?.status, this?.message, this?.data.toDomain());
  }
}

extension ProfileDataResponseMapper on ProfileDataResponse? {
  ProfileDataModel toDomain() {
    return ProfileDataModel(this?.id, this?.name, this?.phone, this?.stc, this?.image);
  }
}
