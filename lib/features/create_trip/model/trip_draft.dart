import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_draft.freezed.dart';

@freezed
class TripDraft with _$TripDraft {
  const TripDraft._();

  factory TripDraft({
    String? title,
    DateTime? startTime,
    DateTime? endTime,
    int? color,
    String? imgPath,
  }) = _TripDraft;

  bool get isFinished {
    if (title == null || title!.isEmpty || startTime == null || endTime == null || color == null) {
      return false;
    }

    return true;
  }
}
