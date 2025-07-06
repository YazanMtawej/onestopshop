import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';
import 'package:onestopshop/features/Acount/presentation/views/login_view.dart';
import 'package:onestopshop/features/Acount/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  AuthCubit(this._repo) : super(AuthInitial());
  Future<void> login(String username, String password) async {
  emit(AuthLoading());
  try {
    final data = await _repo.login(username, password);
    await _storage.write(key: 'access', value: data['access']);
    await _storage.write(key: 'refresh', value: data['refresh']);
    DioHelper.setToken(data['access']);
    print(data);
    emit(AuthAuthenticated(userData: data['user']));
  } catch (e) {
    print('Login error: $e');
    emit(AuthError('Login failed'));
  }
}
  Future<void> register({
  required String username,
  required String password,
  String? firstName,
  String? lastName,
}) async {
  emit(AuthLoading());
  try {
    final data = await _repo.register(
      username: username,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    emit(AuthInitial());
  } catch (e) {
    emit(AuthError('Registration failed'));
  }
}
  Future<void> logout() async {
  emit(AuthLoading());
  try {
    final refresh = await _storage.read(key: 'refresh');
    if (refresh != null) {
      await _repo.logout(refresh);
    }
    await _storage.deleteAll();
    DioHelper.clearToken();
    emit(AuthUnauthenticated());
  } catch (_) {
    emit(AuthError('Logout failed'));
  }
}

  Future<void> tryAutoLogin() async {
    emit(AuthLoading());
    final access = await _storage.read(key: 'access');
    final refresh = await _storage.read(key: 'refresh');
    if (access != null) {
      DioHelper.setToken(access);
      try {
        final profile = await _repo.getProfile();
        emit(AuthAuthenticated(userData: profile));
        return;
      } catch (_) {}
    }
    if (refresh != null) {
      try {
        final newAccess = await _repo.refreshToken(refresh);
        await _storage.write(key: 'access', value: newAccess);
        DioHelper.setToken(newAccess);
        final profile = await _repo.getProfile();
        emit(AuthAuthenticated(userData: profile));
        return;
      } catch (_) {
        await _storage.deleteAll();
      }
    }
    emit(AuthUnauthenticated());
  }
}
