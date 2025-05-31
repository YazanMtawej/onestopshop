
import 'package:flutter/material.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/perfume_rating.dart';

class PerfumeListViewItem extends StatelessWidget {
  const PerfumeListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 130,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.7/4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.logo,)),
              ),
            ),
          ),
       const   SizedBox(width: 30,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                width: MediaQuery.of(context).size.width* .5,
                child: Text('Dark City',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                SizedBox(height: 3,),
                Text('detals',style: TextStyle(fontSize: 14,),),
                 SizedBox(height: 3,),
                Row(children: const[
                  Text("price",style: TextStyle(fontSize:20),),
                  Spacer(),
                  PerfumeRating(),
                ],)
            
            ],
            ),
          ),
        ],
      ),
    );
  }
}
