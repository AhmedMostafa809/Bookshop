import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  Failures(this.errorMessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errorMessage);

  factory ServerFailures.fromDioErrors(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailures('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailures('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailures('No Internet Connection');
        }
        return ServerFailures('Unexpected Error, Please try again!');
      default:
        return ServerFailures('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailures.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailures('Internal Server error, Please try later');
    } else {
      return ServerFailures('Opps There was an Error, Please try again');
    }
  }
}
