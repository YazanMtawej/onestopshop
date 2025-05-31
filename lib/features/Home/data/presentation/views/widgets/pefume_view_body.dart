import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/perfum_list_view_item.dart';

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
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            ),
          ],
        ), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: const Column(
          children: [
            PerfumeListViewItem(),
          ],
        ),
      ),
    ),);
  }
}
