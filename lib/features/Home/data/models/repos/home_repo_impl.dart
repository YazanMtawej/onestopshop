import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:onestopshop/core/errors/failure.dart';
import 'package:onestopshop/core/utils/api_service.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PerfumeModel>>> featchBestSellerPerfume() async{
   try { List<PerfumeModel> perfume=[];
  var data= await apiService.get(endPoint: 'products');
  
  var products=data[' Products']as List;
  perfume = products.map((item)=> PerfumeModel.fromJson(item)).toList();
  
  return right(perfume);
} on Exception catch (e) {
 if (e is DioException){
  return left(ServerFailure.fromDioError(e));
  
}return left( ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, List<PerfumeModel>>> featchFeaturePerfume() async{
    try {
      List<PerfumeModel> perfume=[];
  var data= await apiService.get(endPoint: 'products');
  
  var products=data[' Products']as List;
  perfume = products.map((item)=> PerfumeModel.fromJson(item)).toList();
  
  return right(perfume);
} on Exception catch (e) {
 if (e is DioException){
  return left(ServerFailure.fromDioError(e));
  
}return left( ServerFailure(e.toString()));
  }
  }
}