// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class EditProfileRequest {
  String? name;
  String? phone;
  String? stc;
  File? image;
  EditProfileRequest({
    this.name,
    this.phone,
    this.stc,
    this.image,
  });
}
