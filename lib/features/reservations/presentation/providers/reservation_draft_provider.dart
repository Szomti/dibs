import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../items/items.dart';
import '../../domain/entities/reservation_draft.dart';

final reservationDraftProvider =
    NotifierProvider.autoDispose<ReservationDraftNotifier, ReservationDraft>(
      ReservationDraftNotifier.new,
      dependencies: [currentItemIdProvider],
    );

class ReservationDraftNotifier extends Notifier<ReservationDraft> {
  @override
  ReservationDraft build() {
    final itemId = ref.watch(currentItemIdProvider);
    return ReservationDraft.empty(itemId);
  }

  void setDurationOption(DurationOption option) {
    state = state.copyWith(durationOption: option);
  }

  void setInputOption(DateTimeInputOption option) {
    state = state.copyWith(inputOption: option);
  }

  void setDurationValue(int value) {
    state = state.copyWith(durationValue: value);
  }

  void setDate(DateTime date) {
    state = state.copyWith(
      startDate: state.startDate.copyWith(
        year: date.year,
        month: date.month,
        day: date.day,
      ),
    );
  }

  void setHour(int hour) {
    state = state.copyWith(startDate: state.startDate.copyWith(hour: hour));
  }

  void setMinute(int minute) {
    state = state.copyWith(startDate: state.startDate.copyWith(minute: minute));
  }
}
