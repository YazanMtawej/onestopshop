import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
   // ignore: use_key_in_widget_constructors
   CustomTextField({ this.hinttext,this.onChanged,this.obscureText=false, this.inputType});

  Function(String)? onChanged;
  String? hinttext;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType ,
      obscureText: obscureText!,
      // ignore: body_might_complete_normally_nullable
     
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.grey),
        border:  OutlineInputBorder(
          borderSide:  const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
