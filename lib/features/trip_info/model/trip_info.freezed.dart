// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TripInfo {
  String? get title => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  PexelsPhotoSrc? get pexelsPhotoSrc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TripInfoCopyWith<TripInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripInfoCopyWith<$Res> {
  factory $TripInfoCopyWith(TripInfo value, $Res Function(TripInfo) then) =
      _$TripInfoCopyWithImpl<$Res, TripInfo>;
  @useResult
  $Res call(
      {String? title,
      DateTime? startTime,
      DateTime? endTime,
      int? color,
      PexelsPhotoSrc? pexelsPhotoSrc});
}

/// @nodoc
class _$TripInfoCopyWithImpl<$Res, $Val extends TripInfo>
    implements $TripInfoCopyWith<$Res> {
  _$TripInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? color = freezed,
    Object? pexelsPhotoSrc = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      pexelsPhotoSrc: freezed == pexelsPhotoSrc
          ? _value.pexelsPhotoSrc
          : pexelsPhotoSrc // ignore: cast_nullable_to_non_nullable
              as PexelsPhotoSrc?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripInfoCopyWith<$Res> implements $TripInfoCopyWith<$Res> {
  factory _$$_TripInfoCopyWith(
          _$_TripInfo value, $Res Function(_$_TripInfo) then) =
      __$$_TripInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      DateTime? startTime,
      DateTime? endTime,
      int? color,
      PexelsPhotoSrc? pexelsPhotoSrc});
}

/// @nodoc
class __$$_TripInfoCopyWithImpl<$Res>
    extends _$TripInfoCopyWithImpl<$Res, _$_TripInfo>
    implements _$$_TripInfoCopyWith<$Res> {
  __$$_TripInfoCopyWithImpl(
      _$_TripInfo _value, $Res Function(_$_TripInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? color = freezed,
    Object? pexelsPhotoSrc = freezed,
  }) {
    return _then(_$_TripInfo(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      pexelsPhotoSrc: freezed == pexelsPhotoSrc
          ? _value.pexelsPhotoSrc
          : pexelsPhotoSrc // ignore: cast_nullable_to_non_nullable
              as PexelsPhotoSrc?,
    ));
  }
}

/// @nodoc

class _$_TripInfo extends _TripInfo {
  _$_TripInfo(
      {this.title,
      this.startTime,
      this.endTime,
      this.color,
      this.pexelsPhotoSrc})
      : super._();

  @override
  final String? title;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final int? color;
  @override
  final PexelsPhotoSrc? pexelsPhotoSrc;

  @override
  String toString() {
    return 'TripInfo(title: $title, startTime: $startTime, endTime: $endTime, color: $color, pexelsPhotoSrc: $pexelsPhotoSrc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripInfo &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.pexelsPhotoSrc, pexelsPhotoSrc) ||
                other.pexelsPhotoSrc == pexelsPhotoSrc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, startTime, endTime, color, pexelsPhotoSrc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripInfoCopyWith<_$_TripInfo> get copyWith =>
      __$$_TripInfoCopyWithImpl<_$_TripInfo>(this, _$identity);
}

abstract class _TripInfo extends TripInfo {
  factory _TripInfo(
      {final String? title,
      final DateTime? startTime,
      final DateTime? endTime,
      final int? color,
      final PexelsPhotoSrc? pexelsPhotoSrc}) = _$_TripInfo;
  _TripInfo._() : super._();

  @override
  String? get title;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  int? get color;
  @override
  PexelsPhotoSrc? get pexelsPhotoSrc;
  @override
  @JsonKey(ignore: true)
  _$$_TripInfoCopyWith<_$_TripInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
