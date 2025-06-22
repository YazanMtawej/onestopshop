import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/product_detaills_view_body.dart';

class ProductDetaillsView extends StatelessWidget {
   ProductDetaillsView({super.key,});

final perfume =Get.arguments as PerfumeModel;
  @override
  Widget build(BuildContext context) {
    return ProducDetaillstViewBody(perfume: perfume,);
  }
}
