import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';

class ClothesViewBody extends StatelessWidget {
  const ClothesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          backgroundColor: kButtonColor,
          elevation: 0,
          title: const Text('Clothes', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            ),
          ],
        ), 
      body: const Column(),
    ),);
  }
}