import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const   Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader, // شكل أنيق
          colors: [Colors.deepPurple, Colors.purpleAccent],
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}