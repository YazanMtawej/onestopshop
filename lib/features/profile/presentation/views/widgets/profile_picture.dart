import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [kAppBarColor.shade200,kAppBarColor.shade100,kAppBarColor.shade50,],begin: Alignment.topLeft,end: Alignment.bottomRight),
        shape: BoxShape.circle,
        boxShadow:[ BoxShadow(color: Colors.black,blurRadius :8,offset: Offset(0, 4)),
        ],
        border: Border.all(color: kButtonColor ,width: 3),
      
      ),
      child: ClipOval(child: Image.asset(AssetsData.profile1,fit: BoxFit.fill,),)
      
      );
  }
}