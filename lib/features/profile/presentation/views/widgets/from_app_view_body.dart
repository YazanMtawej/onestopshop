import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_card_text.dart';
import 'package:onestopshop/core/utils/widgets/photo_design.dart';

class FromAppViewBody extends StatelessWidget {
  const FromAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text(
            'About Application',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            CustomCardText(title: 'About the App',text:  ''' 
Welcome to our Perfume Store App (Stop one shop). your ultimate destination for discovering and purchasing premium fragrances from around the world. Our app is designed to offer a seamless and enjoyable shopping experience for perfume lovers of all kinds.
          
What We Offer:
          
* A wide collection of authentic perfumes for men, women, and unisex.
          
* Easy browsing by brand, fragrance type, or occasion.
          
* Exclusive deals, discounts, and seasonal offers.
          
* Fast and secure checkout process.
          
* User reviews and ratings to help you choose the perfect scent.
          
Whether you're looking for your signature fragrance or the perfect gift, our app brings luxury scents to your fingertips.
          
Thank you for choosing us. 
          
we hope you enjoy your fragrance journey!''',colorCard: Colors.brown.shade200,),
      
             PhotoDesign(),
          ],
        ),
      ),
    );
  }
}
