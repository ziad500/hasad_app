class StchRechargeModel {
  bool? status;
  String? message;
  StcRechargeDataModel? data;

  StchRechargeModel(this.message, this.status, this.data);
}

class StcRechargeDataModel {
  String? id;
  String? url;

  StcRechargeDataModel(this.id, this.url);
}
