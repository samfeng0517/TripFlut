// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TripDraft {
  String? get title => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  String? get imgPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TripDraftCopyWith<TripDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripDraftCopyWith<$Res> {
  factory $TripDraftCopyWith(TripDraft value, $Res Function(TripDraft) then) =
      _$TripDraftCopyWithImpl<$Res, TripDraft>;
  @useResult
  $Res call(
      {String? title,
      DateTime? startTime,
      DateTime? endTime,
      int? color,
      String? imgPath});
}

/// @nodoc
class _$TripDraftCopyWithImpl<$Res, $Val extends TripDraft>
    implements $TripDraftCopyWith<$Res> {
  _$TripDraftCopyWithImpl(this._value, this._then);

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
    Object? imgPath = freezed,
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
      imgPath: freezed == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripDraftCopyWith<$Res> implements $TripDraftCopyWith<$Res> {
  factory _$$_TripDraftCopyWith(
          _$_TripDraft value, $Res Function(_$_TripDraft) then) =
      __$$_TripDraftCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      DateTime? startTime,
      DateTime? endTime,
      int? color,
      String? imgPath});
}

/// @nodoc
class __$$_TripDraftCopyWithImpl<$Res>
    extends _$TripDraftCopyWithImpl<$Res, _$_TripDraft>
    implements _$$_TripDraftCopyWith<$Res> {
  __$$_TripDraftCopyWithImpl(
      _$_TripDraft _value, $Res Function(_$_TripDraft) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? color = freezed,
    Object? imgPath = freezed,
  }) {
    return _then(_$_TripDraft(
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
      imgPath: freezed == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TripDraft extends _TripDraft {
  _$_TripDraft(
      {this.title, this.startTime, this.endTime, this.color, this.imgPath})
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
  final String? imgPath;

  @override
  String toString() {
    return 'TripDraft(title: $title, startTime: $startTime, endTime: $endTime, color: $color, imgPath: $imgPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripDraft &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, startTime, endTime, color, imgPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripDraftCopyWith<_$_TripDraft> get copyWith =>
      __$$_TripDraftCopyWithImpl<_$_TripDraft>(this, _$identity);
}

abstract class _TripDraft extends TripDraft {
  factory _TripDraft(
      {final String? title,
      final DateTime? startTime,
      final DateTime? endTime,
      final int? color,
      final String? imgPath}) = _$_TripDraft;
  _TripDraft._() : super._();

  @override
  String? get title;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  int? get color;
  @override
  String? get imgPath;
  @override
  @JsonKey(ignore: true)
  _$$_TripDraftCopyWith<_$_TripDraft> get copyWith =>
      throw _privateConstructorUsedError;
}
