import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';
import 'package:intl/intl.dart';

class TransactionHistoryView extends StatefulWidget {
  const TransactionHistoryView({super.key});

  @override
  State<TransactionHistoryView> createState() => _TransactionHistoryViewState();
}

class _TransactionHistoryViewState extends State<TransactionHistoryView> {
  List<Map<String, dynamic>> transactions = [];
  bool isLoading = true;

  Future<void> fetchTransactions() async {
    try {
      final response = await DioHelper.dio.get('points-history/');
      final List data = response.data['history'];
      setState(() {
        transactions = data.cast<Map<String, dynamic>>();
        isLoading = false;
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to load transaction history",
          backgroundColor: Colors.red.shade300, colorText: Colors.white);
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text("Points History"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade300,
        elevation: 3,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : transactions.isEmpty
              ? const Center(
                  child: Text(
                    "No transactions available yet.",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ListView.separated(
                    itemCount: transactions.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final tx = transactions[index];
                      final isPositive = tx['action_type'] == 'charge';
                      final icon = isPositive ? Icons.add_circle : Icons.shopping_cart_checkout;
                      final color = isPositive ? Colors.green : Colors.red;

                      return Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white,
                        shadowColor: Colors.purple.shade100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                            leading: CircleAvatar(
                              backgroundColor: color.withOpacity(0.1),
                              child: Icon(icon, color: color, size: 24),
                            ),
                            title: Text(
                              "${tx['points']} pts",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: color,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tx['description'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat.yMMMMd()
                                        .add_jm()
                                        .format(DateTime.parse(tx['date']).toLocal()),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
