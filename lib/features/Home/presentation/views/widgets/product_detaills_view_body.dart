import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_card_text.dart';
import 'package:onestopshop/core/utils/widgets/custom_loading_indicator.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/action_detaills_button.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfume_rating.dart';
import 'package:onestopshop/features/cart/presentation/views/cart_view.dart';

class ProducDetaillstViewBody extends StatelessWidget {
  const ProducDetaillstViewBody({super.key, required this.perfume});
  final PerfumeModel perfume;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text('Detaills', style: TextStyle(color: kTextColor)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(
                  () => CartView(),
                  //     transition: Transition.fade,
                  duration: kTranstionDuration,
                );
              },
              icon: const Icon(FontAwesomeIcons.cartPlus, color: kTextColor),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .17,
                vertical: 12,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .24,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: perfume.picture!,
                      placeholder:
                          (context, url) => const CustomLoadingIndicator(),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              perfume.name!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColor,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              perfume.category!,
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
            Text(
              perfume.price!,
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 4),
              child: PerfumeRating(rate: perfume.rating!),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .31,
              child: ListView(
                children: [
                  CustomCardText(
                    title: 'Details',
                    text: '''
Discription : ${perfume.discription!} 
Brand : ${perfume.brand!}
CreatedAt : ${perfume.createdAt!}
Release year : ${perfume.releaseYear!}
Perfumer : ${perfume.perfumer!}
Concertration : ${perfume.concertration!}
Top notes : ${perfume.topNotes!}
Heart notes : ${perfume.heartNotes!}
Base notes : ${perfume.baseNotes!}
Fragrance family : ${perfume.fragranceFamily!}
Bottle size : ${perfume.bottleSize!}
Longevity : ${perfume.longevity!}''',
                    colorCard: kIconColor.shade200,
                  ),
                ],
              ),
            ),
          SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
              child: Center(child: ActionDetaillsButton(perfume: perfume,)),
            ),
          ],
        ),
      ),
    );
  }
}
