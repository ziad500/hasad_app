import 'package:timeago/timeago.dart' as timeago;

String isEmpty(dynamic value, {String? nullValue}) {
  nullValue = nullValue ?? /* LocaleKeys.noContent.tr() */ "no content";
  if (value == null || value == "" || value == "null") {
    return nullValue;
  } else {
    return value.toString();
  }
}

String getDateAgo(String? date) {
  return "${timeago.format(DateTime.parse(date ?? DateTime.now().toString()))} ";
}

bool isImage(String link) =>
    link.contains(".jpeg") ||
    link.contains(".png") ||
    link.contains(".gif") ||
    link.contains(".webp");
