import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/features/invoice/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/invoice/data/mapper/bidding_mapper.dart';
import 'package:hasad_app/features/invoice/data/mapper/mapper.dart';
import 'package:hasad_app/features/invoice/domain/models/bidding.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';
import 'package:hasad_app/features/invoice/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceRemoteDataSource _directSellingListRemoteDataSource;

  InvoiceRepositoryImpl(this._directSellingListRemoteDataSource);

  @override
  Future<Either<Failure, BiddingInvoiceModel>> biddingInvoice(String? purchaseId) {
    return executeAndHandleError<BiddingInvoiceModel>(() async {
      final response = await _directSellingListRemoteDataSource.biddingInvoice(purchaseId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, DirectSelligInvoiceModel>> directSellingInvoice(String purchaseId) {
    return executeAndHandleError<DirectSelligInvoiceModel>(() async {
      final response = await _directSellingListRemoteDataSource.directSellingInvoice(purchaseId);
      return response.toDomain();
    });
  }
}
