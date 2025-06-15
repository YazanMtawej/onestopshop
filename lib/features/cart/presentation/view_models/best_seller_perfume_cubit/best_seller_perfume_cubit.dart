import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo.dart';

part 'best_seller_perfume_state.dart';

class BestSellerPerfumeCubit extends Cubit<BestSellerPerfumeState> {
  BestSellerPerfumeCubit(this.homeRepo) : super(BestSellerPerfumeInitial());
 final HomeRepo homeRepo;

  Future<void> featchBestSellerPerfume() async {
    emit(BestSellerPerfumeLoading());
    var result = await homeRepo.featchBestSellerPerfume();
    result.fold(
      (failure) {
        emit(BestSellerPerfumeFailure( failure.errMessage,));
      },
      (perfume) {
        emit(BestSellerPerfumeSuccess( perfume));
      },
    );
  }
}
