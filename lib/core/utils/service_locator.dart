import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onestopshop/core/utils/api_service.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo_impl.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
