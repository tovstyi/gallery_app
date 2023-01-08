import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import 'errors.dart';
import 'failures.dart';

class ErrorWrapper implements Exception {
  final DioError e;
  final bool checkUnauthorized;
  final String? validationField;

  ErrorWrapper(
      {required this.e, required this.checkUnauthorized, this.validationField});

  Exception call() {
    if (checkUnauthorized) {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        throw SocketException();
      } else {
        if (e.message.contains('SocketException')) {
          throw SocketException();
        } else {
          if (e.response!.statusCode == 401 &&
              e.response!.data == 'Unauthorized!') {
            throw UnauthorizedException();
          } else if (e.response!.statusCode == 400 &&
              e.response!.data["errors"].isEmpty) {
            throw ServerException(message: 'Unknown error', statusCode: 500);
          } else if (e.response!.statusCode == 400 &&
              e.response!.data["errors"].isNotEmpty) {
            throw ValidationException(
                field: e.response!.data["errors"]["param"]);
          } else {
            throw ServerException(message: 'Unknown error', statusCode: 500);
          }
        }
      }
    } else {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        return SocketException();
      } else {
        if (e.message.contains('SocketException')) {
          return SocketException();
        } else {
          return ServerException(message: 'error', statusCode: 111);
        }
      }
    }
  }
}

class ErrorResponse<Type> implements Exception {
  final Exception error;

  ErrorResponse({required this.error});

  Failure call() {
    if (error is SocketException) {
      return SocketFailure();
    } else if (error is UnauthorizedException) {
      return UnauthorizedFailure();
    } else if (error is ValidationException) {
      print('hello form exception!');
      return ValidationFailure(field: (error as ValidationException).field);
    } else {
      return ServerFailure(message: 'error', statusCode: 111);
    }
  }
}
