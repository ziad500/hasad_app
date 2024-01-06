import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/features/bidding/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class BiddingListRepositoryImpl implements BiddingListRepository {
  final BiddingListRemoteDataSource _biddingListRemoteDataSource;

  BiddingListRepositoryImpl(this._biddingListRemoteDataSource);

  @override
  Future<Either<Failure, DirectSellingListModel>> biddingList(
      GetMainListRequest getMainListRequest, String type) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _biddingListRemoteDataSource.biddingList(getMainListRequest, type);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, DirectSellingListModel>> myBiddingList(String? page) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _biddingListRemoteDataSource.myBiddingList(page);
      return response.toDomain();
    });
  }
}
