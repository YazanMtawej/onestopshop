import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errMessage});
final String errMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(errMessage,style: TextStyle(fontSize: 24),));
  }
}