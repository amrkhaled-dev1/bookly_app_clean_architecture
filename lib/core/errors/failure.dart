import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad certificate from ApiServer');

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to ApiServer was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No internet connection');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unexpected error, please try again');
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errMessage: response['error']['message'] ?? 'Authentication error',
      );
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: 'Request not found');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Internal server error');
    } else {
      return ServerFailure(
        errMessage: 'Oops, there was an error. Please try again',
      );
    }
  }
}
