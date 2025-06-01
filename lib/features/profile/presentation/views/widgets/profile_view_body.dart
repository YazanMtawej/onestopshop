import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar( backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text('My Profile', style: TextStyle(fontSize:18,color: Colors.black)),
          ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children:[
                  Container(height: 250, decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kAppBarColor.shade200,kAppBarColor.shade100,kAppBarColor.shade50,],begin: Alignment.topLeft,end: Alignment.bottomRight),
                    
                    boxShadow:[ BoxShadow(color: Colors.black,blurRadius :8,offset: Offset(0, 4)),
                    ],
                    border: Border.all(color: kButtonColor ,width: 3),
                  
                  ),),
                Container(height: 230, decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kAppBarColor.shade200,kAppBarColor.shade100,kAppBarColor.shade50,],begin: Alignment.topLeft,end: Alignment.bottomRight),
                    shape: BoxShape.circle,
                    boxShadow:[ BoxShadow(color: Colors.black,blurRadius :8,offset: Offset(0, 4)),
                    ],
                    border: Border.all(color: kButtonColor ,width: 3),
                  
                  ),),
                
                 Center(
                   child: const Padding(
                                   padding: EdgeInsets.symmetric(vertical: 20),
                                   child: ProfilePicture(),
                                 ),
                 ),
                      ],),
          ],
        ),
      ),
    ),);
  }
}
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