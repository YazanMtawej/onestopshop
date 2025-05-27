

import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_button_other.dart';

class ActionDetaillsButton extends StatelessWidget {
  const ActionDetaillsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: 
     [
      
     CustomButtonOther(
              backgroundColor: kButtonColor,
              textColor: kTextColor,
              text: '90 %' ,
              onPressed: () {},
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
            ),
          CustomButtonOther(
              backgroundColor: kCardColor,
              textColor: kTextColor,
              text: 'Buy',
              onPressed: () {},
              borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            ),
      ],
    );
  }
}