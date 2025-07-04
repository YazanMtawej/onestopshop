
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';

class CartCubit extends Cubit<List<PerfumeModel>> {
  CartCubit() : super([]);

  void addToCart(PerfumeModel perfume) {
    final updatedCart = [...state, perfume];
    emit(updatedCart);
  }

  void removeFromCart(PerfumeModel perfume) {
    final updatedCart = state.where((item) => item != perfume).toList();
    emit(updatedCart);
  }

  void clearCart() {
    emit([]);
  }
}
