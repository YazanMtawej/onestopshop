import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';
import 'package:onestopshop/core/utils/token_storage.dart';

class ChargePointsView extends StatefulWidget {
  const ChargePointsView({super.key});

  @override
  State<ChargePointsView> createState() => _ChargePointsViewState();
}

class _ChargePointsViewState extends State<ChargePointsView> {
  final usernameController = TextEditingController();
  final amountController = TextEditingController();

  Future<void> chargeUserPoints() async {
    final username = usernameController.text.trim();
    final amount = double.tryParse(amountController.text.trim());

    if (username.isEmpty || amount == null) {
      Get.snackbar(
        "Input Error",
        "Please enter a valid username and amount.",
        backgroundColor: Colors.orange,
      );
      return;
    }

    try {
      final token = await TokenStorage.getAccessToken();
      if (token == null) throw Exception("User not authenticated");

      DioHelper.setToken(token);
      final response = await DioHelper.dio.post(
        'charge-user/',
        data: {'username': username, 'amount': amount},
      );

      print("Charge response: ${response.data}");

      final message =
          response.data['message'] ?? "$amount points charged to $username.";
      Get.snackbar("Success", message, backgroundColor: Colors.green);

      usernameController.clear();
      amountController.clear();
    } catch (e) {
      print("Charge error: $e"); 
      Get.snackbar(
        "Error",
        "Failed to charge points.",
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text("Charge Points to User"),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                "Enter the username and amount to charge",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.purple[50],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Points Amount",
                  prefixIcon: const Icon(Icons.star),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.purple[50],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: chargeUserPoints,
                  icon: const Icon(Icons.monetization_on),
                  label: const Text("Charge Points"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[300],
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
