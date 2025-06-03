import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';

class PhotoDesign extends StatelessWidget {
  const PhotoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsData.p2),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Discover luxury fragrances...',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
