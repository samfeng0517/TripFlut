import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/trip_info.dart';

part 'trip_info_controller.g.dart';

@riverpod
class TripInfoController extends _$TripInfoController {
  @override
  FutureOr<TripInfo> build() async {
    return TripInfo();
  }

  void setTripTitle(String text) {
    state = AsyncValue.data(state.value!.copyWith(title: text));
  }

  void setTripRange(DateTime startTime, DateTime endTime) {
    state = AsyncValue.data(state.value!.copyWith(
      startTime: startTime,
      endTime: endTime,
    ));
  }
}
