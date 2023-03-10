import 'package:flutter/material.dart';
import 'package:dvp_test/core/utils/screen_size.dart';

class CustomTextField extends StatelessWidget {
  final bool hidePassword;
  final String label;
  final TextEditingController controller;
  final FocusNode focus;
  final TextFieldType type;
  final Function? onSuffixTap;

  const CustomTextField(
      {super.key,
      this.hidePassword = false,
      required this.label,
      required this.controller,
      required this.focus,
      required this.type,
      this.onSuffixTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.075,
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
        onEditingComplete: () => focus.nextFocus(),
        controller: controller,
        focusNode: focus,
        cursorColor: Colors.purple,
        keyboardType: type == TextFieldType.text
            ? TextInputType.text
            : type == TextFieldType.email
                ? TextInputType.emailAddress
                : TextInputType.visiblePassword,
        obscureText: hidePassword,
        decoration: InputDecoration(
          labelText: label == "" ? null : label,
          labelStyle: TextStyle(
            color: Colors.grey[700]!,
            fontSize: ScreenSize.width(context) * 0.041,
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.purple,
          ),
          border: InputBorder.none,
          suffixIcon: type == TextFieldType.password
              ? GestureDetector(
                  onTap: onSuffixTap != null ? () => onSuffixTap!() : null,
                  child: Icon(
                    (hidePassword)
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye_rounded,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

enum TextFieldType {
  text,
  email,
  password,
}
