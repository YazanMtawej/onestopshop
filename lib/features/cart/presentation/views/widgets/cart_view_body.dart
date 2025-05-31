import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar( backgroundColor: kButtonColor,
          elevation: 0,
          title: const Text('My Cart', style: TextStyle(fontSize:18,color: Colors.black)),
          ),
      body: Column(),
    ));
  }
}