import 'package:flutter/material.dart';

class CustomButtonOther extends StatelessWidget {
  const CustomButtonOther({super.key, required this.backgroundColor, required this.textColor,  this.borderRadius, required this.text,  this.fontSizeText=20, this.onPressed});

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double fontSizeText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SizedBox(
        height: 50,
        
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:borderRadius ?? BorderRadius.circular(16),
            )
          ),
          onPressed: onPressed,
        child: Text(text , style: TextStyle(color: textColor,fontSize: fontSizeText,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}