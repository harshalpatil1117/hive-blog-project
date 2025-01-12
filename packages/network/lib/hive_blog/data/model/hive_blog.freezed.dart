// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hive_blog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HiveBlogState {
  HiveBlogResponse get hiveBlogResponse => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HiveBlogStateCopyWith<HiveBlogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiveBlogStateCopyWith<$Res> {
  factory $HiveBlogStateCopyWith(
          HiveBlogState value, $Res Function(HiveBlogState) then) =
      _$HiveBlogStateCopyWithImpl<$Res, HiveBlogState>;
  @useResult
  $Res call({HiveBlogResponse hiveBlogResponse, bool isLoading});
}

/// @nodoc
class _$HiveBlogStateCopyWithImpl<$Res, $Val extends HiveBlogState>
    implements $HiveBlogStateCopyWith<$Res> {
  _$HiveBlogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiveBlogResponse = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      hiveBlogResponse: null == hiveBlogResponse
          ? _value.hiveBlogResponse
          : hiveBlogResponse // ignore: cast_nullable_to_non_nullable
              as HiveBlogResponse,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HiveBlogStateImplCopyWith<$Res>
    implements $HiveBlogStateCopyWith<$Res> {
  factory _$$HiveBlogStateImplCopyWith(
          _$HiveBlogStateImpl value, $Res Function(_$HiveBlogStateImpl) then) =
      __$$HiveBlogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HiveBlogResponse hiveBlogResponse, bool isLoading});
}

/// @nodoc
class __$$HiveBlogStateImplCopyWithImpl<$Res>
    extends _$HiveBlogStateCopyWithImpl<$Res, _$HiveBlogStateImpl>
    implements _$$HiveBlogStateImplCopyWith<$Res> {
  __$$HiveBlogStateImplCopyWithImpl(
      _$HiveBlogStateImpl _value, $Res Function(_$HiveBlogStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiveBlogResponse = null,
    Object? isLoading = null,
  }) {
    return _then(_$HiveBlogStateImpl(
      hiveBlogResponse: null == hiveBlogResponse
          ? _value.hiveBlogResponse
          : hiveBlogResponse // ignore: cast_nullable_to_non_nullable
              as HiveBlogResponse,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HiveBlogStateImpl implements _HiveBlogState {
  _$HiveBlogStateImpl(
      {this.hiveBlogResponse = const HiveBlogResponse(),
      this.isLoading = true});

  @override
  @JsonKey()
  final HiveBlogResponse hiveBlogResponse;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'HiveBlogState(hiveBlogResponse: $hiveBlogResponse, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HiveBlogStateImpl &&
            (identical(other.hiveBlogResponse, hiveBlogResponse) ||
                other.hiveBlogResponse == hiveBlogResponse) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hiveBlogResponse, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HiveBlogStateImplCopyWith<_$HiveBlogStateImpl> get copyWith =>
      __$$HiveBlogStateImplCopyWithImpl<_$HiveBlogStateImpl>(this, _$identity);
}

abstract class _HiveBlogState implements HiveBlogState {
  factory _HiveBlogState(
      {final HiveBlogResponse hiveBlogResponse,
      final bool isLoading}) = _$HiveBlogStateImpl;

  @override
  HiveBlogResponse get hiveBlogResponse;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$HiveBlogStateImplCopyWith<_$HiveBlogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
