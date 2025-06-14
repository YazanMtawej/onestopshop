import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/presentation/views/perfume_view.dart';
import 'package:onestopshop/core/utils/widgets/custom_app_bar.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/best_seller_grid_view.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/custom_product_image.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const CustomAppBar(text: 'New Trend',),
           const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: SizedBox(width: double.infinity,
                  child: CustomProductImage(
                   image: AssetsData.p4,
                   onTap: () {
                     Get.to(
                       () => PerfumeView(),
                       duration: kTranstionDuration,
                       transition: Transition.fade,
                     );
                   },
                                      ),
                ),
              ),
            ),
         const   SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Best Seller ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
           
            Expanded(child: BestSallerGridView()),
        
        
           
          ],
        ),
      ),
    );
  }
}
