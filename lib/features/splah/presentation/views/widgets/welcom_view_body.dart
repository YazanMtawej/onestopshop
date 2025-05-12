import 'package:flutter/material.dart';

class WelcomViewBody extends StatelessWidget {
  const WelcomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(child: Text("Welcom")),
    ),);
  }
}