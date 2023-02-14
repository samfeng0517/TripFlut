import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_info.freezed.dart';

@freezed
class TripInfo with _$TripInfo {
  const TripInfo._();

  factory TripInfo({
    String? title,
    DateTime? startTime,
    DateTime? endTime,
    int? color,
    String? imgPath,
  }) = _TripInfo;

  bool get isFinished {
    if (title == null ||
        title!.isEmpty ||
        startTime == null ||
        endTime == null ||
        color == null) {
      return false;
    }

    return true;
  }
}
