import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onestopshop/assets.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_card_text.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/action_detaills_button.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/custom_product_image.dart';

class ProducDetaillstViewBody extends StatelessWidget {
  const ProducDetaillstViewBody({super.key});

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
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: kTextColor),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .17,
                vertical: 12,
              ),
              child: CustomProductImage(image: AssetsData.p3),
            ),
            Text(
              'Detaills',
              style: TextStyle(
                color: kTextColor,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Detaills', style: TextStyle(color: kTextColor, fontSize: 22)),
            Text('Detaills', style: TextStyle(color: kTextColor, fontSize: 16)),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .30,
              child: ListView(
                children: [
                  Expanded(
                    child: CustomCardText(
                      title: 'Details',
                      text:
                         ''' flowers, spices, or synthetic aromatic compounds, used to give a pleasant scent to the body or clothing. 
Types of Perfumes:
Parfum (Extrait de Parfum): Highest concentration of fragrance oils, typically 20-40%, with the longest lasting scent.
Eau de Parfum (EdP): Contains 15-20% fragrance oils, a popular choice for everyday wear.
Eau de Toilette (EdT): Features 5-15% fragrance oils, often considered a lighter option.
Eau de Cologne (EdC): Lower concentration of fragrance oils, typically 2-8%, often used as a splash-on.
Eau Fraiche: The lowest concentration of fragrance oils, usually 1-3%, offering a very light and subtle scent. 
Other terms related to perfume:
Fragrance: A general term for a pleasant scent. 
Scent: Another term for smell or fragrance. 
Aroma: A distinctive, often pleasant smell. 
Concentration: The proportion of fragrance oils in a perfume. 
Notes: The different scents that can be detected in a perfume over time, including top notes (initial scent), middle notes (heart of the perfume), and base notes (long-lasting scent). 
How to describe a perfume:
Sensory words:
Use words that evoke the sense of smell, such as floral, woody, citrusy, spicy, musky, etc.
Emotional connection:
Describe how the scent makes you feel, such as confident, relaxed, or sophisticated.
Visual imagery:
Paint a picture with words, like "a warm, comforting scent" or "a refreshing, invigorating fragrance".
Target audience:
Consider who will be wearing the perfume and tailor your description to their preferences. 
''',
                      colorCard: kIconColor.shade200,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
              child: Center(child: ActionDetaillsButton()),
            ),
          ],
        ),
      ),
    );
  }
}
