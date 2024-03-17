import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/slider/domain/models/slider_model.dart';

abstract class SliderRepo {
  Future<Either<Failure, SliderModel>> getSliders();
}
