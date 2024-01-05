class ProfileModel {
  bool? status;
  String? message;
  ProfileDataModel? data;

  ProfileModel(this.status, this.message, this.data);
}

class ProfileDataModel {
  int? id;
  String? name;
  int? phone;
  int? stc;
  String? image;
  ProfileDataModel(
    this.id,
    this.name,
    this.phone,
    this.stc,
    this.image,
  );
}
