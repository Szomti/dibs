import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemDetailsSelectedDateProvider =
    NotifierProvider.autoDispose<_ItemDetailsSelectedDateNotifier, DateTime>(
      _ItemDetailsSelectedDateNotifier.new,
    );

class _ItemDetailsSelectedDateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void selectDate(DateTime date) {
    state = date;
  }
}
