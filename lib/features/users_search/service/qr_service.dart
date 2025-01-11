import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QrCodeService {
  static Future<String?> scanQR(context) async => await SimpleBarcodeScanner.scanBarcode(context,
      isShowFlashIcon: true,
      delayMillis: 2000,
      cancelButtonText: LocaleKeys.cancel.tr(),
      scanType: ScanType.qr);
}
