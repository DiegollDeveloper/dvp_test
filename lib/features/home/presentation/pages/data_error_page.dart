import 'package:flutter/material.dart';
import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:dvp_test/core/widgets/custom_button.dart';

class DataErrorScreen extends StatelessWidget {
  final Function onRetry;

  const DataErrorScreen({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.width(context) * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColors.primary,
                fontSize: ScreenSize.width(context) * 0.046,
                letterSpacing: 0.5,
              ),
              children: const [
                TextSpan(
                  text: "Ocurrió un error al obtener los datos de usuario. ",
                ),
                TextSpan(
                  text: "Verifica tu conexión e intenta nuevamente.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          CustomButton(
            onTap: () => onRetry(),
            loading: false,
            text: "INTENTAR NUEVAMENTE",
          )
        ],
      ),
    );
  }
}
