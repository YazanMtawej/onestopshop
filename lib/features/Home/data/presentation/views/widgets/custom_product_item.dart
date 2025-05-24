import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';

// ignore: must_be_immutable
class CustomProductItem extends StatelessWidget {
   CustomProductItem({super.key,  this.url, this.onTap}) ;
 String? url;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2.7/4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsData.logo))
          ),
        ),
      ),
    );
  }
}