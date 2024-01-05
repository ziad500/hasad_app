import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';

abstract class RequestsRepo {
  Future<Either<Failure, dynamic>> addRequest(AddRequestRequest addRequestRequest);
}
