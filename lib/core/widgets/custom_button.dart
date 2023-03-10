import 'package:flutter/material.dart';
import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:dvp_test/core/utils/screen_size.dart';

class CustomButton extends StatelessWidget {
  final bool loading;
  final String text;
  final Function() onTap;

  const CustomButton({
    super.key,
    required this.loading,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenSize.height(context) * 0.06,
      child: ElevatedButton(
        onPressed: loading ? null : () => onTap(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
        ),
        child: loading
            ? CircularProgressIndicator(color: AppColors.primary)
            : Text(
                text,
                style: TextStyle(
                  fontSize: ScreenSize.width(context) * 0.04,
                ),
              ),
      ),
    );
  }
}
