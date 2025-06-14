import 'package:flutter/material.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfum_list_view_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const PerfumeListViewItem(),
          );
        },
      
      ),
    );
  }
}