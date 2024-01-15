import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/features/invoice/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/invoice/data/mapper/mapper.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';
import 'package:hasad_app/features/invoice/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceRemoteDataSource _directSellingListRemoteDataSource;

  InvoiceRepositoryImpl(this._directSellingListRemoteDataSource);

  @override
  Future<Either<Failure, InvoiceModel>> biddingInvoice(String? purchaseId) {
    return executeAndHandleError<InvoiceModel>(() async {
      final response = await _directSellingListRemoteDataSource.biddingInvoice(purchaseId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, InvoiceModel>> directSellingInvoice(String purchaseId) {
    return executeAndHandleError<InvoiceModel>(() async {
      final response = await _directSellingListRemoteDataSource.directSellingInvoice(purchaseId);
      return response.toDomain();
    });
  }
}
