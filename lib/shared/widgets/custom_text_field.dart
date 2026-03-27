import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(marginXl)),
  );

  final TextEditingController? controller;
  final String? labelText;

  const CustomTextField({super.key, this.controller, this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(labelText: labelText, border: _border),
    );
  }
}
