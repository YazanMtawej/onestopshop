
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo.dart';

part 'featured_perfume_state.dart';

class FeaturedPerfumeCubit extends Cubit<FeaturedPerfumeState> {
  FeaturedPerfumeCubit(this.homeRepo) : super(FeaturedPerfumeInitial());
  final HomeRepo homeRepo;

  Future<void> featchFeaturePerfume() async {
    emit(FeaturedPerfumeLoading());
    var result = await homeRepo.featchFeaturePerfume();
    result.fold(
      (failure) {
        emit(FeaturedPerfumeFailure(failure.errMessage));
      },
      (perfume) {
        emit(FeaturedPerfumeSuccess( perfume));
      },
    );
  }
}
