import 'package:dio/dio.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';

class AuthRepository {
  final Dio _dio = DioHelper.dio;
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'login/',
        data: {'username': username, 'password': password},
      );

      return response.data;
    } on DioException {
      throw Exception('Login failed');
    }
  }

  Future<Map<String, dynamic>> register({
    required String username,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final response = await _dio.post(
        'register/',
        data: {
          'username': username,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      return response.data;
    } on DioException {
      throw Exception('Register failed');
    }
  }

  Future<void> logout(String refreshToken) async {
    await _dio.post('logout/', data: {'refresh': refreshToken});
  }

  Future<String> refreshToken(String refreshToken) async {
    final response = await _dio.post(
      'token/refresh/',
      data: {'refresh': refreshToken},
    );
    return response.data['access'];
  }

  Future<Map<String, dynamic>> getProfile() async {
    final response = await _dio.get('userinfo/');
    return response.data;
  }
}
