import 'package:flutter/material.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfum_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: const PerfumeListViewItem(imageUrl: '',title: '',subtitle: '',price: '',rate: '',),
          );
        },
      
      ),
    );
  }
}