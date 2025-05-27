import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/best_seller_grid_view.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/custom_product_image.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kButtonColor,
          elevation: 0,
          title: const Text('New Trend', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .27,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomProductImage(image: 'assets/images/clothes.jpg',onTap: (){},),
                      SizedBox(width: 20),
                      CustomProductImage(image: 'assets/images/perfume.jpeg',onTap: (){},),
                      SizedBox(width: 20),
                      CustomProductImage(image: 'assets/images/shose.jpeg',onTap: (){},),
                    ],
                  ),
                ),
              ),
              Text(
                "Best Seller ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BestSallerGridView(),

              Spacer(),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
