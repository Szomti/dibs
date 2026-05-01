import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:flutter/material.dart';

import '../../settings.dart';

class SettingsPage extends StatelessWidget {
  static const _listPadding = EdgeInsets.all(dims.sizeMd);

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: _listPadding,
        children: const [
          UserInfo(),
          SizedBox(height: dims.sizeMd),
          LogoutButton(),
          SizedBox(height: dims.sizeMd),
          AboutButton(),
        ],
      ),
    );
  }
}
