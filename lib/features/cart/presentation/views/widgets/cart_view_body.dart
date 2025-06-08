import 'package:flutter/material.dart';
import 'package:onestopshop/core/utils/widgets/custom_app_bar.dart';
import 'package:onestopshop/features/cart/presentation/views/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      
      body: ListView(
        children: [
          CustomAppBar(text: 'My Cart'),
         const SizedBox(height: 600,
          child: CartListView(),)
        ],
      ),
    ));
  }
}