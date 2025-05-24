import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: kButtonColor[50],
      fixedColor: kButtonColor,
              items: [
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home, color: kButtonColor),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.cartArrowDown,
                      color: kButtonColor,
                    ),
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person, color: kButtonColor),
                  ),
                  label: 'Me',
                ),
              ],
            );
  }
}