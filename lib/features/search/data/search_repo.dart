import 'package:dio/dio.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';

class SearchRepo {
  final Dio _dio;

  SearchRepo(this._dio);

  Future<List<PerfumeModel>> searchPerfumes({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    String? brand,
    String? category,
  }) async {
    try {
      final response = await _dio.get(
        "http://127.0.0.1:8000/api/products/",
        queryParameters: {
          if (keyword != null && keyword.isNotEmpty) 'keyword': keyword,
          if (minPrice != null) 'minprice': minPrice,
          if (maxPrice != null) 'maxprice': maxPrice,
          if (brand != null && brand.isNotEmpty) 'brand': brand,
          if (category != null && category.isNotEmpty) 'category': category,
        },
      );

      final jsonData = response.data;
      print("API response: $jsonData");

      if (jsonData is Map<String, dynamic>) {
        final productsList = jsonData[" Products"];
        if (productsList is List) {
          return productsList.map((e) => PerfumeModel.fromJson(e)).toList();
        }
      }

      return [];
    } catch (e) {
      print("Error searching perfumes: $e");
      return [];
    }
  }
}
