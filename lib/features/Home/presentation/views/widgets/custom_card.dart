import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/presentation/views/product_detaills_view.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.perfume, 
  });

  final PerfumeModel perfume;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite=false;
  void toggleFavorite(){
    setState(() {
      isFavorite=!isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetaillsView(),arguments:widget.perfume ,
          duration: kTranstionDuration,
          transition: Transition.fade,
        );
      },
      child: Container(
        color: kButtonColor.shade200,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,

                    color: kCardColor,
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                            widget.perfume.name!  ,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.perfume.price!,
                            style: TextStyle(color: kTextColor, fontSize: 14),
                          ),
                          IconButton(
                            hoverColor:kIconColor.shade400,
                            highlightColor:Colors.redAccent,
                         
                            onPressed: () {toggleFavorite();},
                            icon:  Icon( isFavorite? Icons.favorite:Icons.favorite_border
                             ,
                              color: isFavorite? Colors.red:Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              right: -7,
              top: -50,
   child:  SizedBox(
    height: 90,
    width: 75,
     child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(imageUrl:  widget.perfume.picture!,fit: BoxFit.fill,)),
   ),
                  
              
            ),
          ],
        ),
      ),
    );
  }
}
