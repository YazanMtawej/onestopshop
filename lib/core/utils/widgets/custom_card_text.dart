import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class CustomCardText extends StatelessWidget {
  const CustomCardText({
    super.key,
    required this.text,
    required this.title,
    required this.colorCard,
  });
  final String text;
  final String title;
  final Color colorCard;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCard,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(text, style: TextStyle(fontSize: 16, height: 1.5)),
          ],
        ),
      ),
    );
  }
}
