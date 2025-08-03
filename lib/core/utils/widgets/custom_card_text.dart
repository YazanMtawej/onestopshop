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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: colorCard,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.spa, color: kButtonColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // وصف العطر
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.8,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
