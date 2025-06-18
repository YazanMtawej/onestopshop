import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/presentation/views/product_detaills_view.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.price,
    required this.imgeUrl,
  });

  final String title;
  final String price;
  final String imgeUrl;

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
        //  Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
        Get.to(
          () => ProductDetaillsView(),
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
                              widget.title,
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
                            widget.price,
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

              child: Container(
                height: 90,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image:  DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.imgeUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
