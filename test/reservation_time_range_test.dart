import 'package:dibs/features/reservations/domain/entities/reservation_time_range.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test equality', () {
    test('Equal ranges - same start/end', () {
      final first = ReservationTimeRange(
        start: DateTime.utc(2026, 10, 5, 12, 15),
        end: DateTime.utc(2026, 10, 5, 12, 30),
      );

      final second = ReservationTimeRange(
        start: DateTime.utc(2026, 10, 5, 12, 15),
        end: DateTime.utc(2026, 10, 5, 12, 30),
      );

      expect(first == second, true);
    });

    test('Not equal ranges - same start, different end', () {
      final first = ReservationTimeRange(
        start: DateTime.utc(2026, 10, 5, 12, 15),
        end: DateTime.utc(2026, 10, 5, 12, 30),
      );

      final second = ReservationTimeRange(
        start: DateTime.utc(2026, 10, 5, 12, 15),
        end: DateTime.utc(2027, 11, 6, 13, 31),
      );

      expect(first == second, false);
    });

    test('Not equal ranges - different start, same end', () {
      final first = ReservationTimeRange(
        start: DateTime.utc(2026, 10, 5, 12, 15),
        end: DateTime.utc(2026, 10, 5, 12, 30),
      );

      final second = ReservationTimeRange(
        start: DateTime.utc(2027, 11, 6, 13, 16),
        end: DateTime.utc(2026, 10, 5, 12, 30),
      );

      expect(first == second, false);
    });
  });

  test('No overlap - different ranges', () {
    final first = ReservationTimeRange(
      start: DateTime.utc(2026, 10, 5, 12, 15),
      end: DateTime.utc(2026, 10, 5, 12, 30),
    );

    final second = ReservationTimeRange(
      start: DateTime.utc(2026, 10, 5, 14, 15),
      end: DateTime.utc(2026, 10, 5, 14, 30),
    );

    expect(first.overlaps(second), false);
    expect(second.overlaps(first), false);
  });

  test('Partly overlap', () {
    final first = ReservationTimeRange(
      start: DateTime.utc(2026, 10, 5, 12, 15),
      end: DateTime.utc(2026, 10, 5, 13, 30),
    );

    final second = ReservationTimeRange(
      start: DateTime.utc(2026, 10, 5, 13, 15),
      end: DateTime.utc(2026, 10, 5, 14, 30),
    );

    expect(first.overlaps(second), true);
    expect(second.overlaps(first), true);
  });

  test('Completely overlap', () {
    final first = ReservationTimeRange(
      start: DateTime.utc(2026, 10, 5, 13, 15),
      end: DateTime.utc(2026, 10, 5, 13, 30),
    );

    final second = ReservationTimeRange(
      start: DateTime.utc(2026, 10, 5, 13, 15),
      end: DateTime.utc(2026, 10, 5, 13, 30),
    );

    expect(first.overlaps(second), true);
    expect(second.overlaps(first), true);
  });
}
