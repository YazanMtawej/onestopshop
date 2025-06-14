import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomProductImage extends StatelessWidget {
  const CustomProductImage({super.key,  required this.image, this.onTap}) ;
 final String image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .25,
        child: AspectRatio(
          aspectRatio: 2.7/4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image:  DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image,)),
            ),
          ),
        ),
      ),
    );
  }
}