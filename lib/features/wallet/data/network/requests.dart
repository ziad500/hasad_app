import 'dart:io';

class BankRechargeRequest {
  String value;
  File depositSlip;
  BankRechargeRequest({
    required this.value,
    required this.depositSlip,
  });
}

class STCRechargeRequest {
  String value;
  String? paymentId;
  STCRechargeRequest({required this.value, this.paymentId});
}
