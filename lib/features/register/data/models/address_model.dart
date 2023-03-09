import 'package:flutter/material.dart';

class AddressModel {
  final String type;
  final TextEditingController mainController;
  final TextEditingController secundaryController;
  final TextEditingController complementaryController;
  final FocusNode mainFocus;
  final FocusNode secundaryFocus;
  final FocusNode complementaryFocus;

  const AddressModel({
    required this.type,
    required this.mainController,
    required this.secundaryController,
    required this.complementaryController,
    required this.mainFocus,
    required this.secundaryFocus,
    required this.complementaryFocus,
  });
}
