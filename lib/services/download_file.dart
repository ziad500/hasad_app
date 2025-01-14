/* import 'dart:typed_data';

import 'package:dio/dio.dart';
//import 'package:document_file_save_plus/document_file_save_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;import 'package:permission_handler/permission_handler.dart';
 */
/* 
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
 */
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class DownloadFileService {
  // Save any file in Downloads folder
  static Future<void> saveFileInStorage(Response<dynamic> res, String urlPath,
      {String? type}) async {
    if (await _requestPermission()) {
      Directory downloadsDir = await getDownloadsDirectory();
      String filePath = path.join(downloadsDir.path, path.basename(urlPath));

      File file = File(filePath);
      await file.writeAsBytes(res.data);
      print("File saved at: $filePath");
    }
  }

  // Save PDF specifically in Downloads folder
  static Future<void> savePdfInStorage(Uint8List res, String name) async {
    if (await _requestPermission()) {
      Directory downloadsDir = await getDownloadsDirectory();
      String filePath = path.join(downloadsDir.path, name);

      File file = File(filePath);
      await file.writeAsBytes(res);
      showSnackbar(
          context: navigatorKey.currentContext,
          text: "PDF saved at: $filePath",
          state: ToastStates.SUCCESS);
    }
  }

  // Download file as bytes
  static Future<Response<dynamic>> downloadFileAsBytes(String urlPath) {
    return Dio().get(
      urlPath,
      options: Options(responseType: ResponseType.bytes),
    );
  }

  // Request storage permission
  static Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.request();
      return status.isGranted;
    }
    return true;
  }

  // Get Downloads directory
  static Future<Directory> getDownloadsDirectory() async {
    if (Platform.isAndroid) {
      return Directory('/storage/emulated/0/Download');
    } else {
      return await getApplicationDocumentsDirectory();
    }
  }
}
