import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:dvp_test/core/utils/common_constants.dart';
import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  final String? date;
  final String label;
  final Function(BuildContext) onTap;
  const CustomDateField({
    super.key,
    this.date,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        height: ScreenSize.height(context) * 0.075,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        alignment: Alignment.centerLeft,
        decoration: CommonConstants.fieldsDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: date != null ? AppColors.primary : Colors.grey[700]!,
                fontSize: ScreenSize.width(context) *
                    ((date != null) ? 0.034 : 0.041),
              ),
            ),
            if (date != null)
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  date!,
                  style: TextStyle(
                    color: Colors.grey[700]!,
                    fontSize: ScreenSize.width(context) * 0.041,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
