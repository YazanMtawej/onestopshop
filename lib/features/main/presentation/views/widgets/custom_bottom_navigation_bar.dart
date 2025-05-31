import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      
      color: kTextColor,
      activeColor: kButtonColor[50],
      backgroundColor: kButtonColor[100],
      items: [
        TabItem(
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home,size: 18, color: kButtonColor),
          ),
          title: 'Home',
        ),
        TabItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartArrowDown,size: 18,  color: kButtonColor),
          ),
          title: 'Cart',
        ),
        TabItem(
          icon: IconButton(
            //الانتقال بتغيير الbody
            onPressed: () {},
            icon: const Icon(Icons.person,size: 18,  color: kButtonColor),
          ),
          title: 'Me',
        ),
      ],
    );
  }
}
