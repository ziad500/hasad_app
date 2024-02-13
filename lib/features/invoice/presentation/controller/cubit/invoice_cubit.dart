import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/invoice/domain/models/bidding.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';
import 'package:hasad_app/features/invoice/domain/use_cases/bidding_invoice_usecase.dart';
import 'package:hasad_app/features/invoice/domain/use_cases/direct_selling_invoice_usecase.dart';
import 'package:hasad_app/features/invoice/service/pdf_generator.dart';
import 'package:hasad_app/services/download_file.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final GetDirectSellingInvoiceUseCase _getDirectSellingInvoiceUseCase;
  final GetBiddingInvoiceUseCase _getBiddingInvoiceUseCase;
  InvoiceCubit(this._getDirectSellingInvoiceUseCase, this._getBiddingInvoiceUseCase)
      : super(InvoiceInitial());
  static InvoiceCubit get(context) => BlocProvider.of(context);
  DirectSelligInvoiceModel? invoiceModel;
  Future<void> getDirectSellingInvoice(String id) async {
    emit(GetDirectSellingLoadingState());
    await _getDirectSellingInvoiceUseCase
        .execude(id)
        .then((value) => value.fold((l) => emit(GetDirectSellingErrorState(l.message)), (r) {
              invoiceModel = r;
              emit(GetDirectSellingSuccessState());
            }));
  }

  BiddingInvoiceModel? biddingInvoiceModel;
  Future<void> getBiddingInvoice(String id) async {
    emit(GetBiddingLoadingState());
    await _getBiddingInvoiceUseCase
        .execude(id)
        .then((value) => value.fold((l) => emit(GetBiddingErrorState(l.message)), (r) {
              biddingInvoiceModel = r;
              emit(GetBiddingSuccessState());
            }));
  }

  generatePDF(dynamic model) async {
    await PdfGenerator.createPdf(model).then((value) async {
      Uint8List bytes = await value.save();

      DownloadFileService.savePdfInStorage(
        bytes,
        model.data?.invoiceNumber ?? "",
      );
    } /* */);
  }
}/* 
  void generatePdf(ReportModel model) async {
    emit(GeneratePdfLoadingState());
    try {
      //check storage permission request
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();

      // Check if the permission is granted
      if (statuses[Permission.storage] == PermissionStatus.granted) {
        // Permission granted, access the file here
        //first get download path folder
        await PdfGenerator.getDownloadPath().then((filePath) async {
          if (filePath != "Cannot get download folder path") {
            File file = File("$filePath/${model.fileName}.pdf");
            // then try to open file
            await FilePickerService.openFile(file.path).then((value) async {
              if (value.message.contains("done")) {
                emit(GeneratePdfSuccessState());
              } else {
                //if there is no file then create file (pdf)
                await PdfGenerator.createPdf(model).then((doc) async {
                  //save file
                  Uint8List bytes = await doc.save();
                  //download file
                  await file.writeAsBytes(bytes).then((value) async {
                    //open this file
                    await FilePickerService.openFile(file.path).then((value) async {
                      if (value.message.contains("done")) {
                        emit(GeneratePdfSuccessState());
                      } else if (value.message.contains("MANAGE_EXTERNAL_STORAGE")) {
                        var status = await Permission.manageExternalStorage.status;
                        if (!status.isGranted) {
                          navigatorKey.currentState!
                              .push(showPermissionDialog())
                              .then((value) async {
                            if (status.isGranted) {
                              await FilePickerService.openFile(file.path).then((value) {
                                if (value.message.contains("done")) {
                                  emit(GeneratePdfSuccessState());
                                } else if (value.message.contains("file does not exists")) {
                                  emit(GeneratePdfErrorState(
                                      message: Constants.isArabic
                                          ? "الملف غير موجود"
                                          : "file does not exists"));
                                }
                              });
                            }
                          });
                        }
                      } else {
                        emit(GeneratePdfErrorState(
                            message:
                                Constants.isArabic ? "الملف غير موجود" : "file does not exists"));
                      }
                    }).catchError((e) {
                      emit(GeneratePdfErrorState(message: e.toString()));
                    });
                  }).catchError((e) {
                    emit(GeneratePdfErrorState(message: e.toString()));
                  });
                });
              }
            });
          } else {
            emit(GeneratePdfErrorState(message: filePath.toString()));
          }
        }).catchError((e) {
          emit(GeneratePdfErrorState(message: e.toString()));
        });
      } else {
        // Permission denied, handle error here
        emit(GeneratePdfErrorState(message: "Storage Permission denied"));
      }
    } catch (e) {
      emit(GeneratePdfErrorState(message: e.toString()));
    }
  } */