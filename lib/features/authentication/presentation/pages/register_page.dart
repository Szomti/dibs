import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../authentication.dart';
import '../widgets/register_form.dart';

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
