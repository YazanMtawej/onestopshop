import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/cart/presentation/view_models/cubit/cart_cubit.dart';
import 'package:onestopshop/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:onestopshop/features/search/presentation/views/search_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: canPop,
          backgroundColor: kAppBarColor,
          actions: [
            SizedBox(height: 35, child: Image.asset(AssetsData.logo)),
            const SizedBox(width: 60),
            const Text(
              'My Cart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            IconButton(
              tooltip: 'Clear Cart',
              onPressed: () {
                final cartCubit = context.read<CartCubit>();
                if (cartCubit.state.isNotEmpty) {
                  cartCubit.clearCart();
                  Get.snackbar("Cart", "All items removed",backgroundColor: Colors.red);
                }
              },
              icon: const Icon(Icons.delete_forever, color: Colors.red),
            ),

            IconButton(
              onPressed: () {
                Get.to(
                  () => SearchView(),
                  duration: kTranstionDuration,
                );
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: const CartListView(),
      ),
    );
  }
}
