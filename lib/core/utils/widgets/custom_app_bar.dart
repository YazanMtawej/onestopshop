import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onestopshop/core/utils/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/notification/model/view/test.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 35,
            child: Image.asset(AssetsData.logo)),
           
             Text(text, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18)),
           
             IconButton(
                onPressed: () {
                  Get.to(
                    () => TestNotificationView(),
                    duration: kTranstionDuration,
                    transition: Transition.circularReveal,
                  );
                },
                icon:  const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                ),
              ),
        ],
      ),
    );
  }
}