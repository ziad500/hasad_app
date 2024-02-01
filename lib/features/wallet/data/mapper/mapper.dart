import 'package:hasad_app/features/wallet/data/response/stc_response.dart';
import 'package:hasad_app/features/wallet/domain/models/stc_model.dart';

extension StchRechargeResponseMapper on StchRechargeResponse? {
  StchRechargeModel toDomain() {
    return StchRechargeModel(this?.message, this?.status, this?.url);
  }
}
