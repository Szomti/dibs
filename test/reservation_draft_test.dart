import 'package:dibs/features/reservations/domain/entities/reservation_draft.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('End date with minutes', () {
    final startDate = DateTime.utc(2026, 10, 5, 12, 15);
    final cases = [
      (duration: 1, minutes: 5, expected: true),
      (duration: 2, minutes: 10, expected: true),
      (duration: 5, minutes: 25, expected: true),
      (duration: 10, minutes: 50, expected: true),
      (duration: 12, minutes: 60, expected: true),
      (duration: 24, minutes: 120, expected: true),
    ];

    for (final c in cases) {
      test('Correct duration of ${c.minutes} min', () {
        final draft = ReservationDraft(
          itemId: 0,
          durationOption: DurationOption.minutes,
          inputOption: DateTimeInputOption.time,
          durationValue: c.duration,
          startDate: startDate,
        );

        final expectedEndDate = startDate.add(Duration(minutes: c.minutes));

        expect(draft.endDate.isAtSameMomentAs(expectedEndDate), c.expected);
      });
    }
  });

  group('End date with hours', () {
    final startDate = DateTime.utc(2026, 10, 5, 12, 15);
    final cases = [
      (duration: 1, expected: true),
      (duration: 2, expected: true),
      (duration: 5, expected: true),
      (duration: 10, expected: true),
      (duration: 12, expected: true),
      (duration: 24, expected: true),
    ];

    for (final c in cases) {
      test('Correct duration of ${c.duration} h', () {
        final draft = ReservationDraft(
          itemId: 0,
          durationOption: DurationOption.hours,
          inputOption: DateTimeInputOption.time,
          durationValue: c.duration,
          startDate: startDate,
        );

        final expectedEndDate = startDate.add(Duration(hours: c.duration));

        expect(draft.endDate.isAtSameMomentAs(expectedEndDate), c.expected);
      });
    }
  });
}
