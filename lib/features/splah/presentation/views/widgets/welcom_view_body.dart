import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Acount/presentation/views/login_view.dart';
import 'package:onestopshop/core/utils/widgets/custom_button.dart';

class WelcomViewBody extends StatelessWidget {
  const WelcomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsData.logo),
            SizedBox(height: 33),
            const Text(
              textAlign: TextAlign.center,
              "Welcom to the OneStopShop",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            const Text(textAlign: TextAlign.center, ''' 
    We offer you an electronic products market 
      that contains the best types of products 
      at the cheapest prices ''', style: TextStyle(fontSize: 17)),

            SizedBox(height: 150),
            CustomButton(
              onTap: () {
                Get.to(
                  () => const LoginView(),
                  transition: Transition.rightToLeft,
                  duration: kTranstionDuration,
                );
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
