import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/features/splah/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
  
  }

  @override
  void dispose() {
    
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 100,
              height: 200,
              child: Image.asset(AssetsData.logo),
            ),
            SlidingText(slidingAnimation: slidingAnimation),
          ],
        ),
      ),
    );
  }
  
  void initSlidingAnimation() {
    
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds:  2),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end:  Offset.zero,
    ).animate(animationController);
    animationController.forward();
      
  }
}

