import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl ='http://127.0.0.1:8000/api/';
   final Dio _dio;
   ApiService(this._dio);
   Future<Map<String,dynamic>>get({required String endPoint})async{
   var response= await _dio.get('$_baseUrl$endPoint');
   return response.data;
   }
}