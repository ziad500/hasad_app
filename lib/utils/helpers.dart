String isEmpty(dynamic value, {String? nullValue}) {
  nullValue = nullValue ?? /* AppStrings.noContent.tr() */ "no content";
  if (value == null || value == "" || value == "null") {
    return nullValue;
  } else {
    return value.toString();
  }
}
