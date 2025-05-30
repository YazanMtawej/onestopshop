import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/constents.dart';



class CustomTextField extends StatelessWidget {
   
   const CustomTextField({super.key,  this.hinttext,this.onChanged,this.obscureText=false, this.inputType});

 final Function(String)? onChanged;
 final String? hinttext;
 final bool? obscureText;
 final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      keyboardType: inputType ,
      obscureText: obscureText!,
      // ignore: body_might_complete_normally_nullable
     
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon:  IconButton(onPressed: (){}, icon:   Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.black,
              ),),
        hintText: hinttext,
        hintStyle: const TextStyle(color: kTextColor),
        border:  OutlineInputBorder(
          borderSide:  const BorderSide(color: kCardColor),
          borderRadius: BorderRadius.circular(16)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: kButtonColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
