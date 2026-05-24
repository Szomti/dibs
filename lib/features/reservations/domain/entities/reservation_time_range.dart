import 'package:meta/meta.dart';

@immutable
final class ReservationTimeRange {
  final DateTime start;
  final DateTime end;

  const ReservationTimeRange({required this.start, required this.end});

  bool overlaps(ReservationTimeRange other) {
    return start.isBefore(other.end) && other.start.isBefore(end);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationTimeRange &&
          runtimeType == other.runtimeType &&
          start.isAtSameMomentAs(other.start) &&
          end.isAtSameMomentAs(other.end);

  @override
  int get hashCode => Object.hash(start, end);
}
