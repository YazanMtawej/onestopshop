
import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/profile/presentation/views/widgets/profile_button.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
    appBar:   AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text(
            'My Settings',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      body: ListView(children:const [
        SizedBox(height: 20,),
      ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
        ProfileButton(title: 'Yazan'),
       SizedBox(height: 20,),
    ],
    ) 
    )
    );
  }
}
