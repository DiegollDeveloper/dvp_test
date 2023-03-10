import 'package:flutter/material.dart';
import 'package:dvp_test/core/utils/screen_size.dart';

class UserDataListTile extends StatelessWidget {
  final String tile;
  final String data;

  const UserDataListTile({
    super.key,
    required this.tile,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tile,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenSize.width(context) * 0.04,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          data,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ScreenSize.width(context) * 0.05,
          ),
        ),
      ],
    );
  }
}
