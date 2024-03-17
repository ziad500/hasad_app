import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/slider/domain/models/slider_model.dart';
import 'package:hasad_app/features/slider/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class GetSlidersUseCase {
  final SliderRepo _repo;
  GetSlidersUseCase(
    this._repo,
  );

  Future<Either<Failure, SliderModel>> execude() async {
    return await _repo.getSliders();
  }
}
