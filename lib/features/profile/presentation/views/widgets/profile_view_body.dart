import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar( backgroundColor: kButtonColor,
          elevation: 0,
          title: const Text('My Profile', style: TextStyle(fontSize:18,color: Colors.black)),
          ),
      body: const Column(
        children: [

        ],
      ),
    ),);
  }
}