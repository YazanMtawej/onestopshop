import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';
import 'package:onestopshop/core/utils/token_storage.dart';
import 'package:onestopshop/features/cart/presentation/view_models/cubit/cart_cubit.dart';
import 'package:onestopshop/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:onestopshop/features/profile/presentation/views/transaction_history_view.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  double? userPoints;

  @override
  void initState() {
    super.initState();
    fetchUserBalance();
  }

  Future<void> fetchUserBalance() async {
    try {
      final token = await TokenStorage.getAccessToken();
      if (token == null) throw Exception("User not authenticated");

      DioHelper.setToken(token);
      final response = await DioHelper.dio.get("my-balance/");
      setState(() {
        userPoints = double.tryParse(response.data["points"].toString());
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to load balance",
        backgroundColor: Colors.red,
      );
      print("Error fetching user balance: $e");
    }
  }

  Future<bool> payWithPoints(BuildContext context) async {
    final cartCubit = context.read<CartCubit>();
    final amount = cartCubit.totalPrice;

    if (userPoints == null || amount > userPoints!) {
      Get.snackbar(
        "Error",
        "Insufficient points",
        backgroundColor: Colors.orange,
      );
      return false;
    }

    try {
      final token = await TokenStorage.getAccessToken();
      if (token == null) throw Exception("User not authenticated");

      DioHelper.setToken(token);
      final response = await DioHelper.dio.post(
        'pay-points/',
        data: {'amount': amount},
      );

      print("Payment Response: ${response.data}");

      // ✅ قراءة رسالة النجاح من السيرفر إذا موجودة
      final message =
          response.data['message'] ?? 'Payment completed with points';

      Get.snackbar("Success", message, backgroundColor: Colors.green);
      cartCubit.clearCart();
      await fetchUserBalance();
      return true;
    } catch (e) {
      print("Payment error: $e"); // ✅ اطبع الخطأ الكامل للتشخيص
      Get.snackbar(
        "Error",
        "Payment with points failed",
        backgroundColor: Colors.red,
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final total = cartCubit.totalPrice;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kAppBarColor,
          title: const Text(
            'Your Cart',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 22),
                  const SizedBox(width: 4),
                  Text(
                    userPoints != null
                        ? "${userPoints!.toStringAsFixed(2)} pts"
                        : "Loading...",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(child: CartListView()),
            Container(
              decoration: BoxDecoration(
                color: kCardColor.shade100,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${total.toStringAsFixed(2)} PTS",
                          style: const TextStyle(
                            fontSize: 24,
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await payWithPoints(context);
                           Get.to(() => const TransactionHistoryView());
                        },
                        icon: const Icon(Icons.wallet, color: kPrimaryColor),
                        label: const Text(
                          "Pay with Points",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kButtonColor.shade400,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadowColor: Colors.deepPurpleAccent,
                          elevation: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
