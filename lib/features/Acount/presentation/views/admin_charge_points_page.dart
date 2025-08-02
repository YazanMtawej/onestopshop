import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminChargePointsPage extends StatefulWidget {
  const AdminChargePointsPage({super.key});

  @override
  State<AdminChargePointsPage> createState() => _AdminChargePointsPageState();
}

class _AdminChargePointsPageState extends State<AdminChargePointsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<void> chargePoints() async {
    final username = _usernameController.text.trim();
    final amountStr = _amountController.text.trim();
    final amount = double.tryParse(amountStr);

    if (username.isEmpty || amount == null) {
      Get.snackbar("خطأ", "يرجى إدخال بيانات صحيحة", backgroundColor: Colors.orange);
      return;
    }

    final accessToken = await _storage.read(key: 'access');
    if (accessToken == null) {
      Get.snackbar("خطأ", "غير مصرح، يرجى تسجيل الدخول", backgroundColor: Colors.red);
      return;
    }

    try {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      final response = await _dio.post(
        'http://127.0.0.1:8000/api/charge-user/',
        data: {
          'username': username,
          'amount': amount,
        },
      );

      Get.snackbar("نجاح", response.data['message'], backgroundColor: Colors.green);
      _usernameController.clear();
      _amountController.clear();
    } catch (e) {
      Get.snackbar("خطأ", "فشل في شحن النقاط: ${e.toString()}", backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("شحن نقاط المستخدمين - مسؤول"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "اسم المستخدم"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: "عدد النقاط"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: chargePoints,
              child: const Text("شحن النقاط"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
