import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;

class AuthCircularLoading extends StatelessWidget {
  const AuthCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(dims.sizeMd),
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
