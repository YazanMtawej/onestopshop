import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/features/Home/data/presentation/views/product_detaills_view.dart';
import 'package:onestopshop/features/Home/data/presentation/views/widgets/perfume_rating.dart';

class PerfumeListViewItem extends StatelessWidget {
  const PerfumeListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetaillsView(),
          duration: kTabScrollDuration,
          transition: Transition.fade,
        );
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.6 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.p2),
                  ),
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
                    child: const Text(
                      'Dark City',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text('detals', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 3),
                  Row(
                    children: const [
                      Text("price", style: TextStyle(fontSize: 20)),
                      Spacer(),
                      PerfumeRating(),
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
