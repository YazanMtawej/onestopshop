// lib/features/cart/presentation/views/widgets/cart_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfum_list_view_item.dart';
import 'package:onestopshop/features/cart/presentation/view_models/cubit/cart_cubit.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<PerfumeModel>>(
      builder: (context, cartItems) {
        if (cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: kAppBarColor),));
        }

        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return Dismissible(
              key: ValueKey(item.name),
              background: Container(
                color: kCardColor,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: kIconColor),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                BlocProvider.of<CartCubit>(context).removeFromCart(item);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: PerfumeListViewItem(perfume: item),
              ),
            );
          },
        );
      },
    );
  }
}
