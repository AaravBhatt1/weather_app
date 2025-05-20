// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantEntry _$PlantEntryFromJson(Map<String, dynamic> json) {
  return _PlantEntry.fromJson(json);
}

/// @nodoc
mixin _$PlantEntry {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get img => throw _privateConstructorUsedError;
  @HiveField(2)
  String get family => throw _privateConstructorUsedError;

  /// Serializes this PlantEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantEntryCopyWith<PlantEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantEntryCopyWith<$Res> {
  factory $PlantEntryCopyWith(
          PlantEntry value, $Res Function(PlantEntry) then) =
      _$PlantEntryCopyWithImpl<$Res, PlantEntry>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String img,
      @HiveField(2) String family});
}

/// @nodoc
class _$PlantEntryCopyWithImpl<$Res, $Val extends PlantEntry>
    implements $PlantEntryCopyWith<$Res> {
  _$PlantEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? img = null,
    Object? family = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantEntryImplCopyWith<$Res>
    implements $PlantEntryCopyWith<$Res> {
  factory _$$PlantEntryImplCopyWith(
          _$PlantEntryImpl value, $Res Function(_$PlantEntryImpl) then) =
      __$$PlantEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String img,
      @HiveField(2) String family});
}

/// @nodoc
class __$$PlantEntryImplCopyWithImpl<$Res>
    extends _$PlantEntryCopyWithImpl<$Res, _$PlantEntryImpl>
    implements _$$PlantEntryImplCopyWith<$Res> {
  __$$PlantEntryImplCopyWithImpl(
      _$PlantEntryImpl _value, $Res Function(_$PlantEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? img = null,
    Object? family = null,
  }) {
    return _then(_$PlantEntryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantEntryImpl extends HiveObject implements _PlantEntry {
  _$PlantEntryImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.img,
      @HiveField(2) required this.family});

  factory _$PlantEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantEntryImplFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String img;
  @override
  @HiveField(2)
  final String family;

  @override
  String toString() {
    return 'PlantEntry(name: $name, img: $img, family: $family)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantEntryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.family, family) || other.family == family));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, img, family);

  /// Create a copy of PlantEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantEntryImplCopyWith<_$PlantEntryImpl> get copyWith =>
      __$$PlantEntryImplCopyWithImpl<_$PlantEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantEntryImplToJson(
      this,
    );
  }
}

abstract class _PlantEntry implements PlantEntry {
  factory _PlantEntry(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String img,
      @HiveField(2) required final String family}) = _$PlantEntryImpl;

  factory _PlantEntry.fromJson(Map<String, dynamic> json) =
      _$PlantEntryImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get img;
  @override
  @HiveField(2)
  String get family;

  /// Create a copy of PlantEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantEntryImplCopyWith<_$PlantEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
