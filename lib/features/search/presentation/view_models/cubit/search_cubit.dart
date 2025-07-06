import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/search/data/search_repo.dart';

class SearchCubit extends Cubit<List<PerfumeModel>> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super([]);

  Future<void> search({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    String? brand,
    String? category,
  }) async {
    final results = await searchRepo.searchPerfumes(
      keyword: keyword,
      minPrice: minPrice,
      maxPrice: maxPrice,
      brand: brand,
      category: category,
    );
    emit(results);
  }

  void clear() => emit([]);
}
