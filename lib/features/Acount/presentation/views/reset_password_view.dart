import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onestopshop/core/utils/dio_helper.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Acount/presentation/views/login_view.dart';

class ResetPasswordView extends StatefulWidget {
  final String username;
  final String token;

  const ResetPasswordView({
    super.key,
    required this.username,
    required this.token,
  });

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _tokenCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmCtrl = TextEditingController();

  bool _isLoading = false;
  bool _obscurePass = true;
  bool _obscureConfirm = true;

  @override
  void initState() {
    super.initState();
    _usernameCtrl.text = widget.username;
    _tokenCtrl.text = widget.token;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final res = await DioHelper.dio.post(
        'reset_password/${_tokenCtrl.text.trim()}/',
        data: {
          "username": _usernameCtrl.text.trim(),
          "password": _passwordCtrl.text.trim(),
          "confirmPassword": _confirmCtrl.text.trim(),
        },
      );

      Get.snackbar(
        "Success",
        res.data['details'] ?? 'Password reset successful',
        backgroundColor: Colors.green.shade300,
        colorText: Colors.white,
      );
      Get.offAll(() => LoginView());
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to reset password",
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
        title: const Text("Reset Password"),
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
                readOnly: true,
                decoration: inputDecoration.copyWith(labelText: "Username"),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tokenCtrl,
                readOnly: true,
                decoration: inputDecoration.copyWith(labelText: "Token"),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordCtrl,
                obscureText: _obscurePass,
                decoration: inputDecoration.copyWith(
                  labelText: "New Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscurePass ? Icons.visibility_off : Icons.visibility),
                    onPressed: () =>
                        setState(() => _obscurePass = !_obscurePass),
                  ),
                ),
                validator: (v) =>
                    (v == null || v.length < 6) ? 'Min 6 characters' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmCtrl,
                obscureText: _obscureConfirm,
                decoration: inputDecoration.copyWith(
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirm
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
                validator: (v) => (v != _passwordCtrl.text)
                    ? "Passwords do not match"
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
                          "Reset Password",
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
