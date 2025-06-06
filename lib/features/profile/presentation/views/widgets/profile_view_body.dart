import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/profile/presentation/views/Settings_view.dart';
import 'package:onestopshop/features/profile/presentation/views/from_app_view.dart';
import 'package:onestopshop/features/profile/presentation/views/widgets/profile_button.dart';
import 'package:onestopshop/features/profile/presentation/views/widgets/profile_design.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text(
            'My Profile',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDesign(),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Name User",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ProfileButton(
                title: 'Settings',
                onTap: () {
                  Get.to(
                    () => SettingsView(),
                    duration: kTranstionDuration,
                    transition: Transition.circularReveal,
                  );
                },
              ),
              const SizedBox(height: 20),
              ProfileButton(
                title: 'About the application',
                onTap: () {
                  Get.to(
                    () => FromAppView(),
                    duration: kTranstionDuration,
                    transition: Transition.circularReveal,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
