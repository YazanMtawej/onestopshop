import 'package:flutter/material.dart';
import 'package:onestopshop/core/utils/widgets/custom_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      
      body: Column(
        children: [
          CustomAppBar(text: 'My Cart'),
        ],
      ),
    ));
  }
}