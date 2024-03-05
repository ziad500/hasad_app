import 'package:hasad_app/generated/app_strings.g.dart';

import 'package:easy_localization/easy_localization.dart';

bool validatePhoneNumber(String phoneNumber) {
  String pattern = r'^[0-9\s\-\+\(\)]*$';

  final regExp = RegExp(pattern);

  final isMatch = /* regExp.hasMatch(phoneNumber) && */ phoneNumber.length >= 10;

  return isMatch;
}

bool validateEmail(String email) {
  String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

  final regExp = RegExp(pattern);

  final isMatch = regExp.hasMatch(email);

  return isMatch;
}

bool validatePassword(String passord) {
  // Define a regex pattern to match the string
  final pattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  // Use the pattern to check if the string matches the requirements
  return pattern.hasMatch(passord);
}

String genderEnum(int? gender) {
  if (gender != null) {
    if (gender == 1) {
      return "male";
    } else {
      return "female";
    }
  } else {
    return "not specified";
  }
}

int? genderNumber(String? gender) {
  if (gender != "Gender") {
    if (gender == "Male" || gender == "ذكر") {
      return 1;
    } else {
      return 2;
    }
  } else {
    return null;
  }
}

bool containsNumber(String input) {
  final regex = RegExp(r'\d+');
  return regex.hasMatch(input);
}

String? defaultValidation(dynamic value) {
  if (value == null || value.toString().isEmpty) {
    return LocaleKeys.thisFieldIsRequired.tr();
  }
  return null;
}

String? defaultPhoneNumberValidation(dynamic value) {
  if (value == null || value.toString().isEmpty) {
    return LocaleKeys.thisFieldIsRequired.tr();
  } else if (!validatePhoneNumber(value)) {
    return LocaleKeys.pleaseEnterValidNumber.tr();
  }
  return null;
}

String? defaultStcValidation(dynamic value) {
  if (value == null || value.toString().isEmpty) {
    return LocaleKeys.thisFieldIsRequired.tr();
  } else if (value.length < 10) {
    return LocaleKeys.enterValidStcNumber.tr();
  }
  return null;
}

String? defaultEmailValidation(dynamic value) {
  if (value == null || value.toString().isEmpty) {
    return LocaleKeys.thisFieldIsRequired.tr();
  } else if (!validateEmail(value)) {
    return LocaleKeys.pleaseEnterValidEmail.tr();
  }
  return null;
}

String? defaultPasswordValidation(dynamic value) {
  if (value.isEmpty) {
    return LocaleKeys.thisFieldIsRequired.tr();
  } else if (!validatePassword(value)) {
    return LocaleKeys.pleaseEnterAValidPassword.tr();
  }
  return null;
}

String? defaultConfirmPasswordValidation(dynamic value, String password) {
  if (value.isEmpty) {
    return LocaleKeys.thisFieldIsRequired.tr();
  } else if (value != password) {
    return LocaleKeys.passwordNotMatched.tr();
  }
  if (!validatePassword(value)) {
    return LocaleKeys.pleaseEnterAValidPassword.tr();
  }
  return null;
}
