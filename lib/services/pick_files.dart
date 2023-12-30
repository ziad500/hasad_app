import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  // function to pick file
  static Future<dynamic> pickFile(
      {bool allowMultiple = false, FileType fileType = FileType.image}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowMultiple: allowMultiple,
      allowedExtensions: fileType == FileType.any
          ? ['jpeg', 'png', 'jpg', 'pdf', 'doc', 'xlsx']
          : fileType == FileType.custom
              ? ['pdf', 'doc', 'xlsx']
              : null,
    );
    if (result == null) {
      return null;
    }
    return result;
  }

// function to get file
  static File getFileFromPlatformfile(PlatformFile file) => File(file.path!);

  // function to open file
  //static Future<OpenResult> openFile(String filePath) => OpenFile.open(filePath);
}
