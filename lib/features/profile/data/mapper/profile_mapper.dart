import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';

import '../../domain/models/profile_model.dart';
import '../response/profile_response.dart';

extension ProfileResponseMapper on ProfileResponse? {
  ProfileModel toDomain() {
    return ProfileModel(this?.status, this?.message, this?.data.toDomain());
  }
}

extension ProfileDataResponseMapper on ProfileDataResponse? {
  ProfileDataModel toDomain() {
    return ProfileDataModel(this?.id, this?.name, this?.phone, this?.stc, this?.image,
        this?.balance, this?.reservedBalance, this?.cashBacks?.map((e) => e.toDomain()).toList());
  }
}

extension CashBackResponseMapper on CashBack? {
  CashBackModel toDomain() {
    return CashBackModel(this?.id, this?.userId, this?.amount, this?.percentage,
        this?.advertisment.toDomain(), this?.createdAt, this?.updatedAt);
  }
}
