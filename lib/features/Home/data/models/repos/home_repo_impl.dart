import 'package:dartz/dartz.dart';
import 'package:onestopshop/core/errors/failure.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, List<PerfumeModel>>> featchBestSellerPerfume() {
    // TODO: implement featchBestSellerPerfume
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PerfumeModel>>> featchFeaturePerfume() {
    // TODO: implement featchFeaturePerfume
    throw UnimplementedError();
  }
}