// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals) loaded,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals)? loaded,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals)? loaded,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealsStateLoaded value) loaded,
    required TResult Function(MealsStateLoading value) loading,
    required TResult Function(MealsStateError value) error,
    required TResult Function(MealsStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealsStateLoaded value)? loaded,
    TResult? Function(MealsStateLoading value)? loading,
    TResult? Function(MealsStateError value)? error,
    TResult? Function(MealsStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealsStateLoaded value)? loaded,
    TResult Function(MealsStateLoading value)? loading,
    TResult Function(MealsStateError value)? error,
    TResult Function(MealsStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealsStateCopyWith<$Res> {
  factory $MealsStateCopyWith(
          MealsState value, $Res Function(MealsState) then) =
      _$MealsStateCopyWithImpl<$Res, MealsState>;
}

/// @nodoc
class _$MealsStateCopyWithImpl<$Res, $Val extends MealsState>
    implements $MealsStateCopyWith<$Res> {
  _$MealsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MealsStateLoadedImplCopyWith<$Res> {
  factory _$$MealsStateLoadedImplCopyWith(_$MealsStateLoadedImpl value,
          $Res Function(_$MealsStateLoadedImpl) then) =
      __$$MealsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Meal> meals});
}

/// @nodoc
class __$$MealsStateLoadedImplCopyWithImpl<$Res>
    extends _$MealsStateCopyWithImpl<$Res, _$MealsStateLoadedImpl>
    implements _$$MealsStateLoadedImplCopyWith<$Res> {
  __$$MealsStateLoadedImplCopyWithImpl(_$MealsStateLoadedImpl _value,
      $Res Function(_$MealsStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
  }) {
    return _then(_$MealsStateLoadedImpl(
      null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc

class _$MealsStateLoadedImpl implements MealsStateLoaded {
  const _$MealsStateLoadedImpl(final List<Meal> meals) : _meals = meals;

  final List<Meal> _meals;
  @override
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'MealsState.loaded(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealsStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealsStateLoadedImplCopyWith<_$MealsStateLoadedImpl> get copyWith =>
      __$$MealsStateLoadedImplCopyWithImpl<_$MealsStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals) loaded,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loaded(meals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals)? loaded,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loaded?.call(meals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals)? loaded,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(meals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealsStateLoaded value) loaded,
    required TResult Function(MealsStateLoading value) loading,
    required TResult Function(MealsStateError value) error,
    required TResult Function(MealsStateIdle value) idle,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealsStateLoaded value)? loaded,
    TResult? Function(MealsStateLoading value)? loading,
    TResult? Function(MealsStateError value)? error,
    TResult? Function(MealsStateIdle value)? idle,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealsStateLoaded value)? loaded,
    TResult Function(MealsStateLoading value)? loading,
    TResult Function(MealsStateError value)? error,
    TResult Function(MealsStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MealsStateLoaded implements MealsState, MealsStateBuilder {
  const factory MealsStateLoaded(final List<Meal> meals) =
      _$MealsStateLoadedImpl;

  List<Meal> get meals;
  @JsonKey(ignore: true)
  _$$MealsStateLoadedImplCopyWith<_$MealsStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MealsStateLoadingImplCopyWith<$Res> {
  factory _$$MealsStateLoadingImplCopyWith(_$MealsStateLoadingImpl value,
          $Res Function(_$MealsStateLoadingImpl) then) =
      __$$MealsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealsStateLoadingImplCopyWithImpl<$Res>
    extends _$MealsStateCopyWithImpl<$Res, _$MealsStateLoadingImpl>
    implements _$$MealsStateLoadingImplCopyWith<$Res> {
  __$$MealsStateLoadingImplCopyWithImpl(_$MealsStateLoadingImpl _value,
      $Res Function(_$MealsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MealsStateLoadingImpl implements MealsStateLoading {
  const _$MealsStateLoadingImpl();

  @override
  String toString() {
    return 'MealsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MealsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals) loaded,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals)? loaded,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals)? loaded,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealsStateLoaded value) loaded,
    required TResult Function(MealsStateLoading value) loading,
    required TResult Function(MealsStateError value) error,
    required TResult Function(MealsStateIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealsStateLoaded value)? loaded,
    TResult? Function(MealsStateLoading value)? loading,
    TResult? Function(MealsStateError value)? error,
    TResult? Function(MealsStateIdle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealsStateLoaded value)? loaded,
    TResult Function(MealsStateLoading value)? loading,
    TResult Function(MealsStateError value)? error,
    TResult Function(MealsStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MealsStateLoading implements MealsState, MealsStateBuilder {
  const factory MealsStateLoading() = _$MealsStateLoadingImpl;
}

/// @nodoc
abstract class _$$MealsStateErrorImplCopyWith<$Res> {
  factory _$$MealsStateErrorImplCopyWith(_$MealsStateErrorImpl value,
          $Res Function(_$MealsStateErrorImpl) then) =
      __$$MealsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$MealsStateErrorImplCopyWithImpl<$Res>
    extends _$MealsStateCopyWithImpl<$Res, _$MealsStateErrorImpl>
    implements _$$MealsStateErrorImplCopyWith<$Res> {
  __$$MealsStateErrorImplCopyWithImpl(
      _$MealsStateErrorImpl _value, $Res Function(_$MealsStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MealsStateErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$MealsStateErrorImpl implements MealsStateError {
  const _$MealsStateErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'MealsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealsStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealsStateErrorImplCopyWith<_$MealsStateErrorImpl> get copyWith =>
      __$$MealsStateErrorImplCopyWithImpl<_$MealsStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals) loaded,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals)? loaded,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals)? loaded,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealsStateLoaded value) loaded,
    required TResult Function(MealsStateLoading value) loading,
    required TResult Function(MealsStateError value) error,
    required TResult Function(MealsStateIdle value) idle,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealsStateLoaded value)? loaded,
    TResult? Function(MealsStateLoading value)? loading,
    TResult? Function(MealsStateError value)? error,
    TResult? Function(MealsStateIdle value)? idle,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealsStateLoaded value)? loaded,
    TResult Function(MealsStateLoading value)? loading,
    TResult Function(MealsStateError value)? error,
    TResult Function(MealsStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MealsStateError implements MealsState, MealsStateBuilder {
  const factory MealsStateError(final Object error) = _$MealsStateErrorImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$MealsStateErrorImplCopyWith<_$MealsStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MealsStateIdleImplCopyWith<$Res> {
  factory _$$MealsStateIdleImplCopyWith(_$MealsStateIdleImpl value,
          $Res Function(_$MealsStateIdleImpl) then) =
      __$$MealsStateIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealsStateIdleImplCopyWithImpl<$Res>
    extends _$MealsStateCopyWithImpl<$Res, _$MealsStateIdleImpl>
    implements _$$MealsStateIdleImplCopyWith<$Res> {
  __$$MealsStateIdleImplCopyWithImpl(
      _$MealsStateIdleImpl _value, $Res Function(_$MealsStateIdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MealsStateIdleImpl implements MealsStateIdle {
  const _$MealsStateIdleImpl();

  @override
  String toString() {
    return 'MealsState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MealsStateIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals) loaded,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals)? loaded,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals)? loaded,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealsStateLoaded value) loaded,
    required TResult Function(MealsStateLoading value) loading,
    required TResult Function(MealsStateError value) error,
    required TResult Function(MealsStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealsStateLoaded value)? loaded,
    TResult? Function(MealsStateLoading value)? loading,
    TResult? Function(MealsStateError value)? error,
    TResult? Function(MealsStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealsStateLoaded value)? loaded,
    TResult Function(MealsStateLoading value)? loading,
    TResult Function(MealsStateError value)? error,
    TResult Function(MealsStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class MealsStateIdle implements MealsState {
  const factory MealsStateIdle() = _$MealsStateIdleImpl;
}
