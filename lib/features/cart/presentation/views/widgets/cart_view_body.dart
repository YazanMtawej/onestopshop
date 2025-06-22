import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:onestopshop/features/notification/model/view/test.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canpop = ModalRoute.of(context)?.canPop ?? false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(height: 35, child: Image.asset(AssetsData.logo)),
            SizedBox(width: 60),
            Text(
              'My Cart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 50),
            IconButton(
              onPressed: () {  Get.to(
                    () => TestNotificationView(),
                    duration: kTranstionDuration,
                    transition: Transition.circularReveal,
                  );},
              icon: Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.black,),
            ),
          ],
          backgroundColor: kAppBarColor,

          automaticallyImplyLeading: canpop,
        ),
        body: ListView(
          children: [const SizedBox(height: 600, child: CartListView())],
        ),
      ),
    );
  }
}
