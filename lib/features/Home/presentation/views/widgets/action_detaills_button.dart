import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_button_other.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/cart/presentation/view_models/cubit/cart_cubit.dart';
import 'package:onestopshop/services/notification_service.dart';

class ActionDetaillsButton extends StatelessWidget {
  const ActionDetaillsButton({super.key, required this.perfume});
  final PerfumeModel perfume;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtonOther(
          backgroundColor: kButtonColor,
          textColor: kTextColor,
          text: 'Discounts',
          onPressed: () {},
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        CustomButtonOther(
          backgroundColor: kCardColor,
          textColor: kTextColor,
          text: 'Buy',
          onPressed: () async{
            BlocProvider.of<CartCubit>(context).addToCart(perfume);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${perfume.name} added to cart'),backgroundColor: kCardColor.shade700,),
            );
             await NotificationService().showNotification(
                  id: 1,
                  title: 'You have purchased this perfume',
                  body: 'Thank you for trusting us',
                );
          },
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ],
    );
  }
}
