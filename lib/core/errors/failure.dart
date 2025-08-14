import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Apiserver');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Apiserver');
      case DioExceptionType.badCertificate:
        return ServerFailure('Ssl not work , try later');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to Apiserver was canceld');
      case DioExceptionType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error , try later');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error , try again!');  

      // ignore: unreachable_switch_default
      default :
        return ServerFailure('Opps , There was an error , please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('error try again please');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found ,please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error , please try again');
    } else {
    return ServerFailure('Opps , There was an error , please try again');
    }
  }
}
