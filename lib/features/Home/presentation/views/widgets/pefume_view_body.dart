import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfume_list_view.dart';
import 'package:onestopshop/features/cart/presentation/views/cart_view.dart';

class PerfumeViewBody extends StatelessWidget {
  const PerfumeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text('Perfume', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {Get.to(()=>CartView(),transition: Transition.fade,duration: kTranstionDuration);},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            ),
          ],
        ), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: const Column(
          children: [
            PerfumeListView(),
          ],
        ),
      ),
    ),);
  }
}
