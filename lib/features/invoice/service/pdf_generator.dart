import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfGenerator {
  static Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getExternalStorageDirectory();
        /*   directory = Directory('/storage/emulated/0/Download');

        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        } */
      }
      /*      if (directory?.path != null && directory?.path != "") {
        return directory?.path;
      } else {
        return "Cannot get download folder path";
      } */
    } catch (err) {
      return "Cannot get download folder path";
    }
    return directory?.path;
  }

  static Future createPdf(dynamic model) async {
    final doc = pw.Document();
    final logoImage =
        pw.MemoryImage((await rootBundle.load(ImagesManager.logo)).buffer.asUint8List());

    final pageTheme = await myPageTheme(/* format */);

    final font = await rootBundle.load('assets/fonts/arial.ttf');
    final ttf = pw.Font.ttf(font);

    doc.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (context) {
        return pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Image(
                    alignment: pw.Alignment.center, logoImage, fit: pw.BoxFit.contain, width: 150),
                pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 40),
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text(
                              "${LocaleKeys.invoiceNumber.tr()} : ${model.data?.invoiceNumber ?? ""}",
                              style: pw.TextStyle(
                                  font: ttf,
                                  color: const PdfColor.fromInt(0xFFDE3E3E),
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text("${LocaleKeys.date.tr()} : ${model.data?.createdAt ?? ""}",
                              style: pw.TextStyle(
                                  font: ttf,
                                  color: const PdfColor.fromInt(0xFF34628C),
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 16),
                          pw.Text(model.data?.advertisement?.title ?? "",
                              style: pw.TextStyle(
                                  font: ttf,
                                  color: const PdfColor.fromInt(0xFF34628C),
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text(model.data?.advertisement?.description ?? "",
                              style: pw.TextStyle(
                                  font: ttf,
                                  color: const PdfColor.fromInt(0xFF176AEE),
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 16),
                          pw.Row(children: [
                            pw.Expanded(
                              child: pw.Text(LocaleKeys.price.tr(),
                                  style: pw.TextStyle(
                                      font: ttf,
                                      color: const PdfColor.fromInt(0xFF000000),
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                            pw.Expanded(
                                child: pw.FittedBox(
                              fit: pw.BoxFit.scaleDown,
                              alignment: Constants.isArabic
                                  ? pw.Alignment.centerLeft
                                  : pw.Alignment.centerRight,
                              child: pw.Text(
                                  "${model.data?.subtotal ?? 0} ${LocaleKeys.saudiRiyal.tr()}",
                                  style: pw.TextStyle(
                                      font: ttf,
                                      color: const PdfColor.fromInt(0xFF176AEE),
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold)),
                            ))
                          ]),
                          /////////////////////
                          pw.SizedBox(height: 10),
                          pw.Row(children: [
                            pw.Expanded(
                              child: pw.Text(LocaleKeys.tax.tr(),
                                  style: pw.TextStyle(
                                      font: ttf,
                                      color: const PdfColor.fromInt(0xFF000000),
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                            pw.Expanded(
                                child: pw.FittedBox(
                              fit: pw.BoxFit.scaleDown,
                              alignment: Constants.isArabic
                                  ? pw.Alignment.centerLeft
                                  : pw.Alignment.centerRight,
                              child: pw.Text(
                                  "${(model.data!.total! - model.data!.subtotal!).toStringAsFixed(2)} ${LocaleKeys.saudiRiyal.tr()}",
                                  style: pw.TextStyle(
                                      font: ttf,
                                      color: const PdfColor.fromInt(0xFF176AEE),
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold)),
                            ))
                          ]),
                          /////////////////////
                          pw.SizedBox(height: 10),
                          pw.Row(children: [
                            pw.Expanded(
                              child: pw.Text(LocaleKeys.totalPrice.tr(),
                                  style: pw.TextStyle(
                                      font: ttf,
                                      color: const PdfColor.fromInt(0xFF000000),
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                            pw.Expanded(
                                child: pw.FittedBox(
                              fit: pw.BoxFit.scaleDown,
                              alignment: Constants.isArabic
                                  ? pw.Alignment.centerLeft
                                  : pw.Alignment.centerRight,
                              child: pw.Text(
                                  "${model.data?.total ?? 0} ${LocaleKeys.saudiRiyal.tr()}",
                                  style: pw.TextStyle(
                                      font: ttf,
                                      color: const PdfColor.fromInt(0xFF176AEE),
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold)),
                            ))
                          ])
                        ]))
              ]),
        );
      },
    ));
    return doc;
  }

  static Future<pw.PageTheme> myPageTheme(/* final PdfPageFormat format */) async {
    return pw.PageTheme(
      margin: const pw.EdgeInsets.symmetric(
          horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
      textDirection: Constants.isArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr,
      //orientation: pw.PageOrientation.portrait,
    );
  }
}
