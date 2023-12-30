String isEmpty(dynamic value, {String? nullValue}) {
  nullValue = nullValue ?? /* LocaleKeys.noContent.tr() */ "no content";
  if (value == null || value == "" || value == "null") {
    return nullValue;
  } else {
    return value.toString();
  }
}
