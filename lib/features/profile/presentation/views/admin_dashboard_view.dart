import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/cart/presentation/views/charge_points_view.dart';
import 'package:onestopshop/features/profile/presentation/views/transaction_history_view.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.purple),
                title: const Text(
                  "Charge Points for User",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
                   Get.to(()=>const ChargePointsView(),duration: kTranstionDuration,transition: Transition.circularReveal);
                },
              ),
            ),

            const SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.purple),
                title: const Text(
                  "Transaction History",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
              Get.to(()=>const TransactionHistoryView(),duration: kTranstionDuration,transition: Transition.circularReveal);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
