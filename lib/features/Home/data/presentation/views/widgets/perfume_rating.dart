import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfumeRating extends StatelessWidget {
  const PerfumeRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children:[
        Icon(FontAwesomeIcons.solidStar,color: Color(0xffFFDD4F),),
        SizedBox(width: 6.3,),
        Text('4.8',style: TextStyle(fontSize: 16),),
         SizedBox(width: 5,),
        Text('(2340)',style: TextStyle(fontSize: 14),)
      ],
    );
  }
}