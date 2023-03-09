import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double heightConstant;
  final String label;
  final String? hint;
  final TextEditingController controller;
  final FocusNode focus;
  final TextInputType type;

  const CustomTextField({
    super.key,
    this.heightConstant = 0.075,
    required this.label,
    required this.controller,
    required this.focus,
    this.hint,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * heightConstant,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 0.5,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        focusNode: focus,
        cursorColor: Colors.purple,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label == "" ? null : label,
          hintText: hint,
          labelStyle: TextStyle(
            color: Colors.grey[700]!,
            fontSize: ScreenSize.width(context) * 0.041,
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.purple,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
