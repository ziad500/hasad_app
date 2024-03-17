import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/slider/data/mapper/mapper.dart';
import 'package:hasad_app/features/slider/domain/repository/repo.dart';

import '../../../../core/execute_error_handler.dart';
import '../../../../core/failure.dart';
import '../../domain/models/slider_model.dart';
import '../data_source/remote_data_source.dart';

class SliderRepositoryImpl implements SliderRepo {
  final SliderRemoteDataSource _dataSource;

  SliderRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, SliderModel>> getSliders() {
    return executeAndHandleError(() async {
      final response = await _dataSource.getSliders();
      return response.toDomain();
    });
  }
}
