import 'package:dartz/dartz.dart';
import 'package:onestopshop/core/errors/failure.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<PerfumeModel>>> featchBestSellerPerfume();
 Future<Either<Failure,List<PerfumeModel>>> featchFeaturePerfume();
} 