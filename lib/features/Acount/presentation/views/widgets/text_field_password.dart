import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      width: 240,
      decoration: BoxDecoration(
        color: kButtonColor[100],
        borderRadius: BorderRadius.circular(66),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Pass Word : ',
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 19),
          border: InputBorder.none,
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
