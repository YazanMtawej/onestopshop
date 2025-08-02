import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';

class CartCubit extends Cubit<List<PerfumeModel>> {
  CartCubit() : super([]);

  void addToCart(PerfumeModel perfume) {
    emit([...state, perfume]);
  }

  void removeFromCart(PerfumeModel perfume) {
    emit(state.where((item) => item.id != perfume.id).toList());
  }

  void clearCart() {
    emit([]);
  }

  double get totalPrice {
    return state.fold(0.0, (sum, item) {
      final priceStr = item.price ?? '0';
      final priceNum =
          double.tryParse(priceStr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
      return sum + priceNum;
    });
  }
}
