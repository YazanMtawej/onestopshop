import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/profile/presentation/views/widgets/profile_picture.dart';

class ProfileDesign extends StatelessWidget {
  const ProfileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
              alignment: Alignment.center,
              children:[
                  Container(height: 270, decoration: BoxDecoration(
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
           
                      ],);
  }
}