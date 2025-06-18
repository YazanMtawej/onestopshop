import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfumeRating extends StatelessWidget {
  const PerfumeRating({super.key, required this.rate});
final String rate;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children:[
      const  Icon(FontAwesomeIcons.solidStar,color: Color(0xffFFDD4F),),
      const  SizedBox(width: 6.3,),
        Text(rate,style: TextStyle(fontSize: 16),),
     const    SizedBox(width: 5,),
      const  Text('(2340)',style: TextStyle(fontSize: 14),)
      ],
    );
  }
}