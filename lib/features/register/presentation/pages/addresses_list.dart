import 'package:flutter/material.dart';
import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:dvp_test/core/widgets/custom_text_field.dart';
import 'package:dvp_test/features/register/data/models/address_model.dart';

class AddressesList extends StatelessWidget {
  final List<AddressModel> addresses;
  final Function(int) onRemoveAddressTap;

  const AddressesList({
    super.key,
    required this.addresses,
    required this.onRemoveAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      padding: EdgeInsets.zero,
      itemCount: addresses.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Flexible(
              child: CustomTextField(
                label:
                    "Dirección${(addresses.length > 1) ? " ${index + 1}" : ""}",
                controller: addresses[index].addressController,
                focus: addresses[index].addressFocus,
                type: TextFieldType.text,
              ),
            ),
            if (index != 0)
              IconButton(
                onPressed: () => onRemoveAddressTap(index),
                icon: Icon(
                  Icons.remove,
                  color: AppColors.primary,
                ),
              )
          ],
        ),
      ),
    );
  }
}
