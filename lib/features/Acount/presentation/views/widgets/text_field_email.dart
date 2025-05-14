import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key});

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
      child: const TextField(
        
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          hintText: 'email : ',
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 19),
          border: InputBorder.none,
          icon: Icon(Icons.person),
          suffixIcon: Icon(Icons.message),
        ),
      ),
    );
  }
}
