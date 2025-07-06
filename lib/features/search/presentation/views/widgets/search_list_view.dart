import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfum_list_view_item.dart';
import 'package:onestopshop/features/search/presentation/view_models/cubit/search_cubit.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, List>(
      builder: (context, perfumes) {
        if (perfumes.isEmpty) {
          return const Center(child: Text("No results found"));
        }

        return ListView.builder(
          itemCount: perfumes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: PerfumeListViewItem(perfume: perfumes[index]),
            );
          },
        );
      },
    );
  }
}
