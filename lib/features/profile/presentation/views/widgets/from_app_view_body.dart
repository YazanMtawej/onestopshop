import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';

class FromAppViewBody extends StatelessWidget {
  const FromAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text(
            'About Application',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ) ,
      body: ListView(children:[
        Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  margin: const EdgeInsets.all(16),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About the App',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
''' Welcome to our Perfume Store App (Stop one shop). your ultimate destination for discovering and purchasing premium fragrances from around the world. Our app is designed to offer a seamless and enjoyable shopping experience for perfume lovers of all kinds.
        
    What We Offer:
        
*A wide collection of authentic perfumes for men, women, and unisex.
        
*Easy browsing by brand, fragrance type, or occasion.
        
*Exclusive deals, discounts, and seasonal offers.
        
*Fast and secure checkout process.
        
*User reviews and ratings to help you choose the perfect scent.
        
Whether you're looking for your signature fragrance or the perfect gift, our app brings luxury scents to your fingertips.
        
Thank you for choosing us. 
        
we hope you enjoy your fragrance journey!''',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
       
      ],
    ),
  ),
),
     Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AssetsData.p2),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
    ),
  ),
  child: Padding(
    padding: EdgeInsets.all(24),
    child: Text(
      'Discover luxury fragrances...',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  ),
)
      ],),
    );
  }
}