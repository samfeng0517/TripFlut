import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
class Trip with _$Trip {
  factory Trip({
    required String id,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    String? imageUrl,
    required int color,
  }) = _Trip;
}
