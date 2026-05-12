import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemSelectedDateProvider =
    NotifierProvider.autoDispose<_ItemSelectedDateNotifier, DateTime>(
      _ItemSelectedDateNotifier.new,
    );

class _ItemSelectedDateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void selectDate(DateTime date) {
    state = date;
  }
}
