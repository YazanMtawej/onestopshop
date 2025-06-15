import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/core/utils/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/action_detaills_button.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/custom_product_image.dart';

class ProducDetaillstViewBody extends StatelessWidget {
  const ProducDetaillstViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text('Detaills', style: TextStyle(color: kTextColor)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: kTextColor),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .17),
              child: CustomProductImage(image: AssetsData.p3,),
            ),
            Text(
              'Detaills',
              style: TextStyle(
                color: kTextColor,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Detaills', style: TextStyle(color: kTextColor, fontSize: 22)),
            Text('Detaills', style: TextStyle(color: kTextColor, fontSize: 16)),
          Spacer(),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 35),
             child: Center(child: ActionDetaillsButton()),
           ),
         
          ],
        ),
      ),
    );
  }
}
