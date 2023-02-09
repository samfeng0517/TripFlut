// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startTime,
      DateTime endTime,
      String? imageUrl,
      String color});
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? imageUrl = freezed,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$_TripCopyWith(_$_Trip value, $Res Function(_$_Trip) then) =
      __$$_TripCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startTime,
      DateTime endTime,
      String? imageUrl,
      String color});
}

/// @nodoc
class __$$_TripCopyWithImpl<$Res> extends _$TripCopyWithImpl<$Res, _$_Trip>
    implements _$$_TripCopyWith<$Res> {
  __$$_TripCopyWithImpl(_$_Trip _value, $Res Function(_$_Trip) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? imageUrl = freezed,
    Object? color = null,
  }) {
    return _then(_$_Trip(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Trip implements _Trip {
  _$_Trip(
      {required this.id,
      required this.title,
      required this.startTime,
      required this.endTime,
      this.imageUrl,
      required this.color});

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String? imageUrl;
  @override
  final String color;

  @override
  String toString() {
    return 'Trip(id: $id, title: $title, startTime: $startTime, endTime: $endTime, imageUrl: $imageUrl, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trip &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, startTime, endTime, imageUrl, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripCopyWith<_$_Trip> get copyWith =>
      __$$_TripCopyWithImpl<_$_Trip>(this, _$identity);
}

abstract class _Trip implements Trip {
  factory _Trip(
      {required final String id,
      required final String title,
      required final DateTime startTime,
      required final DateTime endTime,
      final String? imageUrl,
      required final String color}) = _$_Trip;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String? get imageUrl;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$_TripCopyWith<_$_Trip> get copyWith => throw _privateConstructorUsedError;
}
