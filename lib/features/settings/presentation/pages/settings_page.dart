import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:flutter/material.dart';

import '../../settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(dims.sizeMd),
        children: const [
          UserInfo(),
          SizedBox(height: dims.sizeMd),
          LogoutButton(),
        ],
      ),
    );
  }
}
