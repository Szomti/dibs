import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:dibs/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';

import '../../authentication.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: dims.sizeSm),
          AnimatedTitle(),
          SizedBox(height: dims.sizeLg),
          RegisterForm(),
        ],
      ),
    );
  }
}
