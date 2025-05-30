import 'package:flutter/material.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/custom_card.dart';

class BestSallerGridView extends StatelessWidget {
  const BestSallerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .43,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 35,
          
        ),
        child: GridView.builder(
          itemCount: 8,
          clipBehavior: Clip.antiAlias,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 100,
          ),
          itemBuilder: (context, index) {
            return CustomCard();
          },
        ),
      ),
    );
  }
}
