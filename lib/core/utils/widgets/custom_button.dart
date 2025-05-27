import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
const  CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
              color: kButtonColor, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child:  Text(
              text,
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
