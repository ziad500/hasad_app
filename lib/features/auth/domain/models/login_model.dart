class MainUserAuthModel {
  bool? status;
  String? message;
  UserDataModel? data;

  MainUserAuthModel(this.status, this.message, this.data);
}

class UserDataModel {
  String? token;
  UserModel? user;

  UserDataModel(this.token, this.user);
}

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneKey;
  int? phoneNumber;
  String? region;
  String? city;
  String? district;
  String? addressDetails;
  String? photo;

  UserModel(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneKey,
    this.phoneNumber,
    this.region,
    this.city,
    this.district,
    this.addressDetails,
    this.photo,
  );
}
