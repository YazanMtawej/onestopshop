import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.title, this.onTap});
final String title;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [kAppBarColor.shade200,kAppBarColor.shade100,kAppBarColor.shade50,],begin: Alignment.topLeft,end: Alignment.bottomRight),
          shape: BoxShape.rectangle,
          boxShadow:[ BoxShadow(color: Colors.black,blurRadius :8,offset: Offset(0, 4)),
          ],
          border: Border.all(color: kButtonColor ,width: 3),
        
        ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        )
        ),
    );
  }
}