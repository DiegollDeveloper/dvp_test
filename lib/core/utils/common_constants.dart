import 'package:flutter/material.dart';

class CommonConstants {
  static final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static final BoxDecoration fieldsDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey[300]!,
        blurRadius: 0.5,
      )
    ],
  );
}
