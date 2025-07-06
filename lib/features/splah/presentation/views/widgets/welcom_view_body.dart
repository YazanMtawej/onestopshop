import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/photo_design.dart';
import 'package:onestopshop/features/Acount/presentation/views/login_view.dart';
import 'package:onestopshop/core/utils/widgets/custom_button.dart';
import 'package:onestopshop/services/notification_service.dart';

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
            SizedBox(height: 29),
            SizedBox(
              height: 200,
              child: AspectRatio(
                aspectRatio: 2.7 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: kAppBarColor,
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(AssetsData.logo),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 33),
            const Text(
              textAlign: TextAlign.center,
              "Welcom to the OneStopShop",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            const Text(
              textAlign: TextAlign.center,
              '''We offer you an electronic products market 
   that contains the best types of products 
   at the cheapest prices''',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            PhotoDesign(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: CustomButton(
                onTap: () async {
                  Get.to(
                    () => const LoginView(),
                    transition: Transition.rightToLeft,
                    duration: kTranstionDuration,
                  );
                  final DateTime now = DateTime.now();
                  final DateTime scheduledTime = now.add(
                    const Duration(seconds: 15),
                  );

                  await NotificationService().scheduleNotification(
                    id: 2,
                    title: 'Buy all your perfumes from our app',
                    body:
                        'We offer the finest fragrances from around the world',
                    scheduledTime: scheduledTime,
                  );
                },
                text: 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
