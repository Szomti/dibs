import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => _showAboutDialog(context),
            child: const Text('About app'),
          ),
        ),
      ],
    );
  }

  Future<void> _showAboutDialog(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (!context.mounted) return;
    final now = DateTime.now();
    showAboutDialog(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      applicationLegalese: '© ${now.year} Dibs Team. All rights reserved.',
      applicationIcon: Image.asset(
        'assets/icon/icon-sm.png',
        height: dims.sizeXxl,
        width: dims.sizeXxl,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
