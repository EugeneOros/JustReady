// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_meals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectMealsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectMealsStateCopyWith<$Res> {
  factory $SelectMealsStateCopyWith(
          SelectMealsState value, $Res Function(SelectMealsState) then) =
      _$SelectMealsStateCopyWithImpl<$Res, SelectMealsState>;
}

/// @nodoc
class _$SelectMealsStateCopyWithImpl<$Res, $Val extends SelectMealsState>
    implements $SelectMealsStateCopyWith<$Res> {
  _$SelectMealsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Meal> meals, Order? currentOrder});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SelectMealsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
    Object? currentOrder = freezed,
  }) {
    return _then(_$LoadedImpl(
      null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      freezed == currentOrder
          ? _value.currentOrder
          : currentOrder // ignore: cast_nullable_to_non_nullable
              as Order?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(final List<Meal> meals, this.currentOrder)
      : _meals = meals;

  final List<Meal> _meals;
  @override
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  final Order? currentOrder;

  @override
  String toString() {
    return 'SelectMealsState.loaded(meals: $meals, currentOrder: $currentOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            (identical(other.currentOrder, currentOrder) ||
                other.currentOrder == currentOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_meals), currentOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loaded(meals, currentOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loaded?.call(meals, currentOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(meals, currentOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements SelectMealsState, SelectMealsStateBuilder {
  const factory Loaded(final List<Meal> meals, final Order? currentOrder) =
      _$LoadedImpl;

  List<Meal> get meals;
  Order? get currentOrder;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SelectMealsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SelectMealsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SelectMealsState, SelectMealsStateBuilder {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ShowMealAddedSnackBarImplCopyWith<$Res> {
  factory _$$ShowMealAddedSnackBarImplCopyWith(
          _$ShowMealAddedSnackBarImpl value,
          $Res Function(_$ShowMealAddedSnackBarImpl) then) =
      __$$ShowMealAddedSnackBarImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowMealAddedSnackBarImplCopyWithImpl<$Res>
    extends _$SelectMealsStateCopyWithImpl<$Res, _$ShowMealAddedSnackBarImpl>
    implements _$$ShowMealAddedSnackBarImplCopyWith<$Res> {
  __$$ShowMealAddedSnackBarImplCopyWithImpl(_$ShowMealAddedSnackBarImpl _value,
      $Res Function(_$ShowMealAddedSnackBarImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowMealAddedSnackBarImpl implements ShowMealAddedSnackBar {
  const _$ShowMealAddedSnackBarImpl();

  @override
  String toString() {
    return 'SelectMealsState.showMealAddedSnackBar()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowMealAddedSnackBarImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return showMealAddedSnackBar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return showMealAddedSnackBar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (showMealAddedSnackBar != null) {
      return showMealAddedSnackBar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return showMealAddedSnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return showMealAddedSnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (showMealAddedSnackBar != null) {
      return showMealAddedSnackBar(this);
    }
    return orElse();
  }
}

abstract class ShowMealAddedSnackBar
    implements SelectMealsState, SelectMealsStateListener {
  const factory ShowMealAddedSnackBar() = _$ShowMealAddedSnackBarImpl;
}

/// @nodoc
abstract class _$$ShowErrorSnackBarImplCopyWith<$Res> {
  factory _$$ShowErrorSnackBarImplCopyWith(_$ShowErrorSnackBarImpl value,
          $Res Function(_$ShowErrorSnackBarImpl) then) =
      __$$ShowErrorSnackBarImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowErrorSnackBarImplCopyWithImpl<$Res>
    extends _$SelectMealsStateCopyWithImpl<$Res, _$ShowErrorSnackBarImpl>
    implements _$$ShowErrorSnackBarImplCopyWith<$Res> {
  __$$ShowErrorSnackBarImplCopyWithImpl(_$ShowErrorSnackBarImpl _value,
      $Res Function(_$ShowErrorSnackBarImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowErrorSnackBarImpl implements ShowErrorSnackBar {
  const _$ShowErrorSnackBarImpl();

  @override
  String toString() {
    return 'SelectMealsState.showErrorSnackBar()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowErrorSnackBarImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return showErrorSnackBar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return showErrorSnackBar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (showErrorSnackBar != null) {
      return showErrorSnackBar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return showErrorSnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return showErrorSnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (showErrorSnackBar != null) {
      return showErrorSnackBar(this);
    }
    return orElse();
  }
}

abstract class ShowErrorSnackBar
    implements SelectMealsState, SelectMealsStateListener {
  const factory ShowErrorSnackBar() = _$ShowErrorSnackBarImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SelectMealsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'SelectMealsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SelectMealsState, SelectMealsStateBuilder {
  const factory Error(final Object error) = _$ErrorImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$SelectMealsStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl implements Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'SelectMealsState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Meal> meals, Order? currentOrder) loaded,
    required TResult Function() loading,
    required TResult Function() showMealAddedSnackBar,
    required TResult Function() showErrorSnackBar,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult? Function()? loading,
    TResult? Function()? showMealAddedSnackBar,
    TResult? Function()? showErrorSnackBar,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Meal> meals, Order? currentOrder)? loaded,
    TResult Function()? loading,
    TResult Function()? showMealAddedSnackBar,
    TResult Function()? showErrorSnackBar,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowMealAddedSnackBar value)
        showMealAddedSnackBar,
    required TResult Function(ShowErrorSnackBar value) showErrorSnackBar,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult? Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(ShowMealAddedSnackBar value)? showMealAddedSnackBar,
    TResult Function(ShowErrorSnackBar value)? showErrorSnackBar,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements SelectMealsState {
  const factory Idle() = _$IdleImpl;
}
