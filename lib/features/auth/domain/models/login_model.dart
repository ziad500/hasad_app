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
  int? id;
  String? name;
  int? phone;
  int? stc;
  String? image;
  UserModel(
    this.id,
    this.name,
    this.phone,
    this.stc,
    this.image,
  );
}
