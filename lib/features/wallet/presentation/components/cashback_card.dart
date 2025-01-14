import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class CashBackCard extends StatelessWidget {
  final CashBackModel cashBackModel;

  const CashBackCard({Key? key, required this.cashBackModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon or Circle Avatar for cashback
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.green.withOpacity(0.1),
              child: const Icon(Icons.monetization_on, color: Colors.green, size: 30),
            ),
            const SizedBox(width: 16),
            // Cashback Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${cashBackModel.amount} ${LocaleKeys.saudiRiyal.tr()}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${LocaleKeys.earned.tr()} ${cashBackModel.percentage}% ${LocaleKeys.cashBack.tr()}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${LocaleKeys.date.tr()}: ${cashBackModel.createdAt}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ), /* 
            // Action Icon (optional)
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey), */
          ],
        ),
      ),
    );
  }
}
