import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  initializeDateFormatting('en');
  runApp(const ProviderScope(retry: globalRetry, child: MyApp()));
}

Duration? globalRetry(int retryCount, Object error) {
  if (retryCount >= 3) return null;
  if (error is ProviderException) return null;
  return Duration(milliseconds: 200 * (1 << retryCount));
}
