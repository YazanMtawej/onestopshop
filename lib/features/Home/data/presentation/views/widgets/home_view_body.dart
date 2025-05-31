import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/data/presentation/views/perfume_view.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/best_seller_grid_view.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/custom_product_image.dart';
import 'package:onestopshop/features/search/presentation/views/search_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text('New Trend', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(
                  () => SearchView(),
                  duration: kTranstionDuration,
                  transition: Transition.fade,
                );
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView(
                  children: [
                    CustomProductImage(
                     image: AssetsData.logo,
                     onTap: () {
                       Get.to(
                         () => PerfumeView(),
                         duration: kTranstionDuration,
                         transition: Transition.fade,
                       );
                     },
                                        ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Best Seller ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BestSallerGridView(),

              Spacer(),
             
            ],
          ),
        ),
      ),
    );
  }
}
