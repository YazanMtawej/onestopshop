import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_app_bar.dart';
import 'package:onestopshop/features/Acount/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:onestopshop/features/profile/presentation/views/settings_view.dart';
import 'package:onestopshop/features/profile/presentation/views/from_app_view.dart';
import 'package:onestopshop/features/profile/presentation/views/widgets/profile_button.dart';
import 'package:onestopshop/features/profile/presentation/views/widgets/profile_design.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: 'My Profile'),
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
                    
                  );
                },
              ),
              Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<AuthCubit>().logout();
                               Navigator.pop(context); 
                            },
                            icon: const Icon(Icons.logout),
                            label: const Text("Login Out"),
                            style: ElevatedButton.styleFrom(backgroundColor: kIconColor.shade100),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
