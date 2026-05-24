import 'package:meta/meta.dart';

import 'reservation_time_range.dart';

enum DurationOption {
  hours._(60),
  minutes._(5);

  final int multiplier;

  const DurationOption._(this.multiplier);
}

enum DateTimeInputOption { date, time }

@immutable
final class ReservationDraft {
  final int itemId;
  final DurationOption durationOption;
  final DateTimeInputOption inputOption;
  final int durationValue;
  final DateTime startDate;

  DateTime get endDate => startDate.add(
    Duration(minutes: durationValue * durationOption.multiplier),
  );

  ReservationTimeRange get timeRange =>
      ReservationTimeRange(start: startDate, end: endDate);

  const ReservationDraft({
    required this.itemId,
    required this.durationOption,
    required this.inputOption,
    required this.durationValue,
    required this.startDate,
  });

  factory ReservationDraft.empty(int itemId) {
    final now = DateTime.now();
    return ReservationDraft(
      itemId: itemId,
      durationOption: DurationOption.minutes,
      inputOption: DateTimeInputOption.date,
      durationValue: 6,
      startDate: DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute + (5 - (now.minute % 5)),
      ),
    );
  }

  ReservationDraft copyWith({
    int? itemId,
    DurationOption? durationOption,
    DateTimeInputOption? inputOption,
    int? durationValue,
    DateTime? startDate,
  }) {
    return ReservationDraft(
      itemId: itemId ?? this.itemId,
      durationOption: durationOption ?? this.durationOption,
      inputOption: inputOption ?? this.inputOption,
      durationValue: durationValue ?? this.durationValue,
      startDate: startDate ?? this.startDate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationDraft &&
          runtimeType == other.runtimeType &&
          durationOption == other.durationOption &&
          inputOption == other.inputOption &&
          durationValue == other.durationValue &&
          startDate.isAtSameMomentAs(other.startDate);

  @override
  int get hashCode =>
      Object.hash(durationOption, inputOption, durationValue, startDate);
}
