import 'package:dio/dio.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class DownloadFileService {
  // Function to save a file in storage
  static Future<void> saveFileInStorage(Response<dynamic> res, String urlPath) {
    return DocumentFileSavePlus()
        .saveFile(res.data, path.basename(urlPath), "application/${urlPath.split(".").last}");
  }

  // Function to download a file as bytes
  static Future<Response<dynamic>> downloadFileAsBytes(String urlPath) {
    return Dio().get(
      urlPath,
      options: Options(responseType: ResponseType.bytes),
    );
  }
}
