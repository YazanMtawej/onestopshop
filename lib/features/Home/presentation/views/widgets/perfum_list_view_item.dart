import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:onestopshop/core/utils/widgets/custom_loading_indicator.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';
import 'package:onestopshop/features/Home/presentation/views/product_detaills_view.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfume_rating.dart';

class PerfumeListViewItem extends StatelessWidget {
  const PerfumeListViewItem({
    super.key,
 required this.perfume,
  });

  final PerfumeModel perfume;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetaillsView(),arguments: perfume,
          duration: kTabScrollDuration,
          transition: Transition.fade,
        );
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: perfume.picture!,
                  placeholder: (context, url) =>const CustomLoadingIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      perfume.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(perfume.category!, style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(perfume.price!, style: TextStyle(fontSize: 20)),
                      const Spacer(),
                      PerfumeRating(rate: perfume.rating!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
