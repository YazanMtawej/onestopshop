import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/core/utils/widgets/custom_error.dart';
import 'package:onestopshop/core/utils/widgets/custom_loading_indicator.dart';
import 'package:onestopshop/features/Home/presentation/view_models/featured_perfume_cubit/featured_perfume_cubit.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfum_list_view_item.dart';

class PerfumeListView extends StatelessWidget {
  const PerfumeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedPerfumeCubit, FeaturedPerfumeState>(
      builder: (context, state) {
        if (state is FeaturedPerfumeSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.perfume.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: PerfumeListViewItem(
                      perfume: state.perfume[index],
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedPerfumeFailure) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
