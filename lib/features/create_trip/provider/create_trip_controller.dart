import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tripflut/features/create_trip/model/trip_draft.dart';

part 'create_trip_controller.g.dart';

@riverpod
class CreateTripController extends _$CreateTripController {
  @override
  FutureOr<TripDraft> build() async {
    return TripDraft();
  }

  void setTripTitle(String text) {
    state = AsyncValue.data(state.value!.copyWith(title: text));
  }
}
