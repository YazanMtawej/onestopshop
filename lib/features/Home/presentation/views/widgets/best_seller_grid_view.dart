import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/core/utils/widgets/custom_error.dart';
import 'package:onestopshop/core/utils/widgets/custom_loading_indicator.dart';
import 'package:onestopshop/features/Home/presentation/view_models/best_seller_perfume_cubit/best_seller_perfume_cubit.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/custom_card.dart';

class BestSallerGridView extends StatelessWidget {
  const BestSallerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerPerfumeCubit, BestSellerPerfumeState>(
      builder: (context, state) {
        
        if(state is BestSellerPerfumeSuccess ){
       return  SizedBox(
          height: MediaQuery.of(context).size.height * .43,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: GridView.builder(
              itemCount: state.perfume.length,
              clipBehavior: Clip.antiAlias,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return CustomCard(perfume: state.perfume[index],);
              },
            ),
          ),
        );}else if (state is BestSellerPerfumeFailure){
          return  CustomError(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
