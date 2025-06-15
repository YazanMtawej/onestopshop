import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';

part 'best_seller_perfume_state.dart';

class BestSellerPerfumeCubit extends Cubit<BestSellerPerfumeState> {
  BestSellerPerfumeCubit() : super(BestSellerPerfumeInitial());

}
