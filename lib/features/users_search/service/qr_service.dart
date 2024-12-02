import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeService {
  static Future<String> scanQR() async =>
      await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
}
