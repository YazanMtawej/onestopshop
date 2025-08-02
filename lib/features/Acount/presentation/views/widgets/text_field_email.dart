import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class TextFieldUser extends StatelessWidget {
  const TextFieldUser({super.key, required this.controller, required this.label});
 final TextEditingController controller;
 final String label;

  @override
  Widget build(BuildContext context) {
   
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      width: 250,
      
      decoration: BoxDecoration(
        color: kButtonColor[100],
        borderRadius: BorderRadius.circular(66),
      ),
      child:  TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          hintText: label,
          labelText: label,
          labelStyle: TextStyle(fontSize: 19),
          border: InputBorder.none,
          icon: Icon(Icons.person),
          suffixIcon: Icon(Icons.message),
        ),
      ),
    );
  }
}
