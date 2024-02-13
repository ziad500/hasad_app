import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class DownloadFileService {
  // Function to save a file in storage
  static Future<void> saveFileInStorage(Response<dynamic> res, String urlPath, {String? type}) {
    return DocumentFileSavePlus().saveFile(
        res.data, path.basename(urlPath), "application/${type ?? urlPath.split(".").last}");
  }

  static Future<void> savePdfInStorage(Uint8List res, String name) {
    return DocumentFileSavePlus().saveFile(res, name, "application/pdf");
  }

  // Function to download a file as bytes
  static Future<Response<dynamic>> downloadFileAsBytes(String urlPath) {
    return Dio().get(
      urlPath,
      options: Options(responseType: ResponseType.bytes),
    );
  }
}
