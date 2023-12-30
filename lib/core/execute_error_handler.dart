// Custom helper function for make our code more clean.
// T → is a generic type define the return type [String, bool, etc..].
// The helper will take function and execute it with try catch block.
// if the execution success then it will return the result.
// if the execution failed then it will handle the error and return it.
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hasad_app/core/error_handler.dart';
import 'package:hasad_app/core/failure.dart';

Future<Either<Failure, T>> executeAndHandleError<T>(
  Future<T> Function() function,
) async {
  try {
    final result = await function();
    return right(result);
  } catch (error) {
    if (error is DioException) {
      return left(hangdleResponseError(error));
    } else {
      return left(Failure(100, error.toString()));
    }
  }
}
