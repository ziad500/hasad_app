import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class QrCodeService {
  static Future<String> scanQR() async =>
      await FlutterBarcodeScanner.scanBarcode('#ff6666', LocaleKeys.cancel.tr(), true, ScanMode.QR);
}
