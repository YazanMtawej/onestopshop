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
      final response = await DioHelper.dio.get('transaction-history/');
      final List data = response.data;
      setState(() {
        transactions = data.cast<Map<String, dynamic>>();
        isLoading = false;
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to load transactions", backgroundColor: Colors.red);
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
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text("Transaction History"),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
        elevation: 3,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : transactions.isEmpty
              ? const Center(child: Text("No transactions found."))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.purple[50],
                      child: ListTile(
                        leading: const Icon(Icons.receipt_long, color: Colors.purple),
                        title: Text(
                          "${tx['username']} • ${tx['amount']} pts",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "By ${tx['admin']} on ${DateFormat.yMMMd().add_jm().format(DateTime.parse(tx['date']).toLocal())}",
                          style: const TextStyle(fontSize: 13),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      ),
                    );
                  },
                ),
    );
  }
}
