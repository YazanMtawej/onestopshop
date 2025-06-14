import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/presentation/views/home_view.dart';
import 'package:onestopshop/features/cart/presentation/views/cart_view.dart';
import 'package:onestopshop/features/profile/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeView(key: ValueKey('home')),
    CartView(key: ValueKey('cart')),
    ProfileView(key: ValueKey('profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: kTranstionDuration,
          transitionBuilder:
              (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
          child: pages[currentIndex],
        ),
        bottomNavigationBar: Container(
          height: 55,
          color: kCardColor.shade400,
          child: ConvexAppBar(
            color: kTextColor,
            activeColor: kButtonColor[100],
            backgroundColor: kButtonColor[200],
            items: [
              TabItem(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home, size: 19, color: kIconColor),
                ),
                title: 'Home',
              ),
              TabItem(
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.cartArrowDown,
                    size: 19,
                    color: kIconColor,
                  ),
                ),
                title: 'Cart',
              ),
              TabItem(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person, size: 19, color: kIconColor),
                ),
                title: 'Me',
              ),
            ],
            initialActiveIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
