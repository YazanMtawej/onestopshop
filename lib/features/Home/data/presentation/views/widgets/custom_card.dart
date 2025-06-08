import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/data/presentation/views/product_detaills_view.dart';

class CustomCard extends StatelessWidget {
   const CustomCard({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      //  Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      Get.to(()=> ProductDetaillsView(),duration: kTranstionDuration,transition: Transition.fade);
      },
      child: Container(
       color: kButtonColor.shade200,
        child: Stack(
          
          clipBehavior:Clip.none ,
          children: [
            Container(
             
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    
                    color: kCardColor,
                    spreadRadius: 0,
                    offset: const Offset(10, 10)
                  ),
                ]
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'plane',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                           r'$' '400',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        
            Positioned(
              right: -7,
              top: -50,
                  
              child:  Container(
                height: 110,
                width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsData.p1),)
            ),
                    ),
                  ),
        ],
          ),
      ),
    );
  }
}
