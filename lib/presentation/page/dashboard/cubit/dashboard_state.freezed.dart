// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(Order readyOrder) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(Order readyOrder)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(Order readyOrder)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

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
  $Res call({List<Order> orders});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$LoadedImpl(
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(final List<Order> orders) : _orders = orders;

  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'DashboardState.loaded(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(Order readyOrder) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(Order readyOrder)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(Order readyOrder)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
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

abstract class Loaded implements DashboardState, DashboardStateBuilder {
  const factory Loaded(final List<Order> orders) = _$LoadedImpl;

  List<Order> get orders;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AnnounceReadyImplCopyWith<$Res> {
  factory _$$AnnounceReadyImplCopyWith(
          _$AnnounceReadyImpl value, $Res Function(_$AnnounceReadyImpl) then) =
      __$$AnnounceReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Order readyOrder});
}

/// @nodoc
class __$$AnnounceReadyImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$AnnounceReadyImpl>
    implements _$$AnnounceReadyImplCopyWith<$Res> {
  __$$AnnounceReadyImplCopyWithImpl(
      _$AnnounceReadyImpl _value, $Res Function(_$AnnounceReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? readyOrder = null,
  }) {
    return _then(_$AnnounceReadyImpl(
      null == readyOrder
          ? _value.readyOrder
          : readyOrder // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc

class _$AnnounceReadyImpl implements AnnounceReady {
  const _$AnnounceReadyImpl(this.readyOrder);

  @override
  final Order readyOrder;

  @override
  String toString() {
    return 'DashboardState.announceReady(readyOrder: $readyOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnounceReadyImpl &&
            (identical(other.readyOrder, readyOrder) ||
                other.readyOrder == readyOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, readyOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnounceReadyImplCopyWith<_$AnnounceReadyImpl> get copyWith =>
      __$$AnnounceReadyImplCopyWithImpl<_$AnnounceReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(Order readyOrder) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return announceReady(readyOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(Order readyOrder)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return announceReady?.call(readyOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(Order readyOrder)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (announceReady != null) {
      return announceReady(readyOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return announceReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return announceReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (announceReady != null) {
      return announceReady(this);
    }
    return orElse();
  }
}

abstract class AnnounceReady implements DashboardState, DashboardStateListener {
  const factory AnnounceReady(final Order readyOrder) = _$AnnounceReadyImpl;

  Order get readyOrder;
  @JsonKey(ignore: true)
  _$$AnnounceReadyImplCopyWith<_$AnnounceReadyImpl> get copyWith =>
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
    extends _$DashboardStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'DashboardState.loading()';
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
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(Order readyOrder) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(Order readyOrder)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(Order readyOrder)? announceReady,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
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

abstract class Loading implements DashboardState, DashboardStateBuilder {
  const factory Loading() = _$LoadingImpl;
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
    extends _$DashboardStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'DashboardState.error(error: $error)';
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
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(Order readyOrder) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(Order readyOrder)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(Order readyOrder)? announceReady,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
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

abstract class Error implements DashboardState, DashboardStateBuilder {
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
    extends _$DashboardStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl implements Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'DashboardState.idle()';
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
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(Order readyOrder) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(Order readyOrder)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(Order readyOrder)? announceReady,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
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

abstract class Idle implements DashboardState {
  const factory Idle() = _$IdleImpl;
}
