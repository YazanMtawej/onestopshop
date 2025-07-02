import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({super.key, required this.controller, required this.label,  this.isPassword=false});
 final TextEditingController controller;
 final String label;
 final bool isPassword;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 250,
      decoration: BoxDecoration(
        color: kButtonColor[100],
        borderRadius: BorderRadius.circular(66),
      ),
      child: TextField(
        controller: controller,
        obscureText:isPassword,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Pass Word : ',
          labelText: label,
          labelStyle: const TextStyle(fontSize: 19),
          border: InputBorder.none,
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
        ),
      ),
    );
  }
}
