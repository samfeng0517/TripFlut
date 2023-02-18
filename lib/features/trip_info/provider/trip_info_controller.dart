import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

import '../model/trip_info.dart';
import '../pick_image_or_color/model/pexels_photo.dart';

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

  void setPexelsPhoto(PexelsPhoto pexelsPhoto) {
    int color;
    if (pexelsPhoto.avgColor != null) {
      color = HexColor(pexelsPhoto.avgColor!).value;
    } else {
      final rnd = math.Random();
      color = Color(rnd.nextInt(0xffffffff)).value;
    }
    state = AsyncValue.data(state.value!.copyWith(
      pexelsPhotoSrc: pexelsPhoto.src,
      color: color,
    ));
  }

  void setTripColor(Color color) {
    state = AsyncValue.data(state.value!.copyWith(
      color: color.value,
      pexelsPhotoSrc: null,
    ));
  }
}
