import 'package:flutter/material.dart';

class AddressModel {
  final TextEditingController addressController;
  final FocusNode addressFocus;

  const AddressModel({
    required this.addressController,
    required this.addressFocus,
  });
}
