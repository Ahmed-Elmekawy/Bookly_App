import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioException) {
    return switch (dioException.type) {
      DioExceptionType.connectionTimeout =>
        ServerFailure('Connection timeout with ApiServer'),
      DioExceptionType.sendTimeout =>
        ServerFailure('Send timeout with ApiServer'),
      DioExceptionType.receiveTimeout =>
        ServerFailure('Receive timeout with ApiServer'),
      DioExceptionType.badCertificate => ServerFailure('Bad Certificate'),
      DioExceptionType.badResponse =>
        ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data),
      DioExceptionType.cancel =>
        ServerFailure('Request to ApiServer was canceled'),
      DioExceptionType.connectionError => ServerFailure("No Internet Connection"),
      DioExceptionType.unknown =>
        ServerFailure("Something went wrong, please try again"),
    };
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
