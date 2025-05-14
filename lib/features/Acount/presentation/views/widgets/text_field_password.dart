import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({super.key});

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
        obscureText:true,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Pass Word : ',
          labelText: 'Password',
          labelStyle: const TextStyle(fontSize: 19),
          border: InputBorder.none,
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
        ),
      ),
    );
  }
}
