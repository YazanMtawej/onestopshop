import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';
import 'package:onestopshop/features/Acount/presentation/views/reset_password_view.dart';


class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  bool _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final response = await DioHelper.dio.post(
        'forgot_password/',
        data: {
          "username": _usernameCtrl.text.trim(),
        },
      );

      final token = response.data['token'];
      Get.snackbar(
        "Success",
        "Token generated successfully",
        backgroundColor: Colors.green.shade300,
        colorText: Colors.white,
      );

      // ⬇️ اذهب مباشرة لشاشة ResetPasswordView ومرر البيانات
      Get.to(
        () => ResetPasswordView(
          username: _usernameCtrl.text.trim(),
          token: token,
        ),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to generate reset token",
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: kAppBarColor,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameCtrl,
                decoration: inputDecoration.copyWith(labelText: 'Username'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Username required'
                    : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Generate reset token',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
