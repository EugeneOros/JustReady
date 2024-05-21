// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)
        loaded,
    required TResult Function() loadedEmpty,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult? Function()? loadedEmpty,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult Function()? loadedEmpty,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersStateLoadingLoaded value) loaded,
    required TResult Function(OrdersStateLoadingLoadedEmpty value) loadedEmpty,
    required TResult Function(OrdersStateLoading value) loading,
    required TResult Function(OrdersStateLoadingError value) error,
    required TResult Function(OrdersStateLoadingIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersStateLoadingLoaded value)? loaded,
    TResult? Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult? Function(OrdersStateLoading value)? loading,
    TResult? Function(OrdersStateLoadingError value)? error,
    TResult? Function(OrdersStateLoadingIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersStateLoadingLoaded value)? loaded,
    TResult Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult Function(OrdersStateLoading value)? loading,
    TResult Function(OrdersStateLoadingError value)? error,
    TResult Function(OrdersStateLoadingIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrdersStateLoadingLoadedImplCopyWith<$Res> {
  factory _$$OrdersStateLoadingLoadedImplCopyWith(
          _$OrdersStateLoadingLoadedImpl value,
          $Res Function(_$OrdersStateLoadingLoadedImpl) then) =
      __$$OrdersStateLoadingLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Order> orders, Order? orderToDelete, int deletionCountdownValue});
}

/// @nodoc
class __$$OrdersStateLoadingLoadedImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateLoadingLoadedImpl>
    implements _$$OrdersStateLoadingLoadedImplCopyWith<$Res> {
  __$$OrdersStateLoadingLoadedImplCopyWithImpl(
      _$OrdersStateLoadingLoadedImpl _value,
      $Res Function(_$OrdersStateLoadingLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? orderToDelete = freezed,
    Object? deletionCountdownValue = null,
  }) {
    return _then(_$OrdersStateLoadingLoadedImpl(
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      freezed == orderToDelete
          ? _value.orderToDelete
          : orderToDelete // ignore: cast_nullable_to_non_nullable
              as Order?,
      null == deletionCountdownValue
          ? _value.deletionCountdownValue
          : deletionCountdownValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OrdersStateLoadingLoadedImpl implements OrdersStateLoadingLoaded {
  const _$OrdersStateLoadingLoadedImpl(
      final List<Order> orders, this.orderToDelete, this.deletionCountdownValue)
      : _orders = orders;

  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final Order? orderToDelete;
  @override
  final int deletionCountdownValue;

  @override
  String toString() {
    return 'OrdersState.loaded(orders: $orders, orderToDelete: $orderToDelete, deletionCountdownValue: $deletionCountdownValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateLoadingLoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.orderToDelete, orderToDelete) ||
                other.orderToDelete == orderToDelete) &&
            (identical(other.deletionCountdownValue, deletionCountdownValue) ||
                other.deletionCountdownValue == deletionCountdownValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orders),
      orderToDelete,
      deletionCountdownValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersStateLoadingLoadedImplCopyWith<_$OrdersStateLoadingLoadedImpl>
      get copyWith => __$$OrdersStateLoadingLoadedImplCopyWithImpl<
          _$OrdersStateLoadingLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)
        loaded,
    required TResult Function() loadedEmpty,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loaded(orders, orderToDelete, deletionCountdownValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult? Function()? loadedEmpty,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loaded?.call(orders, orderToDelete, deletionCountdownValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult Function()? loadedEmpty,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders, orderToDelete, deletionCountdownValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersStateLoadingLoaded value) loaded,
    required TResult Function(OrdersStateLoadingLoadedEmpty value) loadedEmpty,
    required TResult Function(OrdersStateLoading value) loading,
    required TResult Function(OrdersStateLoadingError value) error,
    required TResult Function(OrdersStateLoadingIdle value) idle,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersStateLoadingLoaded value)? loaded,
    TResult? Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult? Function(OrdersStateLoading value)? loading,
    TResult? Function(OrdersStateLoadingError value)? error,
    TResult? Function(OrdersStateLoadingIdle value)? idle,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersStateLoadingLoaded value)? loaded,
    TResult Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult Function(OrdersStateLoading value)? loading,
    TResult Function(OrdersStateLoadingError value)? error,
    TResult Function(OrdersStateLoadingIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OrdersStateLoadingLoaded
    implements OrdersState, OrdersStateBuilder {
  const factory OrdersStateLoadingLoaded(
      final List<Order> orders,
      final Order? orderToDelete,
      final int deletionCountdownValue) = _$OrdersStateLoadingLoadedImpl;

  List<Order> get orders;
  Order? get orderToDelete;
  int get deletionCountdownValue;
  @JsonKey(ignore: true)
  _$$OrdersStateLoadingLoadedImplCopyWith<_$OrdersStateLoadingLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersStateLoadingLoadedEmptyImplCopyWith<$Res> {
  factory _$$OrdersStateLoadingLoadedEmptyImplCopyWith(
          _$OrdersStateLoadingLoadedEmptyImpl value,
          $Res Function(_$OrdersStateLoadingLoadedEmptyImpl) then) =
      __$$OrdersStateLoadingLoadedEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrdersStateLoadingLoadedEmptyImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateLoadingLoadedEmptyImpl>
    implements _$$OrdersStateLoadingLoadedEmptyImplCopyWith<$Res> {
  __$$OrdersStateLoadingLoadedEmptyImplCopyWithImpl(
      _$OrdersStateLoadingLoadedEmptyImpl _value,
      $Res Function(_$OrdersStateLoadingLoadedEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrdersStateLoadingLoadedEmptyImpl
    implements OrdersStateLoadingLoadedEmpty {
  const _$OrdersStateLoadingLoadedEmptyImpl();

  @override
  String toString() {
    return 'OrdersState.loadedEmpty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateLoadingLoadedEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)
        loaded,
    required TResult Function() loadedEmpty,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loadedEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult? Function()? loadedEmpty,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loadedEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult Function()? loadedEmpty,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loadedEmpty != null) {
      return loadedEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersStateLoadingLoaded value) loaded,
    required TResult Function(OrdersStateLoadingLoadedEmpty value) loadedEmpty,
    required TResult Function(OrdersStateLoading value) loading,
    required TResult Function(OrdersStateLoadingError value) error,
    required TResult Function(OrdersStateLoadingIdle value) idle,
  }) {
    return loadedEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersStateLoadingLoaded value)? loaded,
    TResult? Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult? Function(OrdersStateLoading value)? loading,
    TResult? Function(OrdersStateLoadingError value)? error,
    TResult? Function(OrdersStateLoadingIdle value)? idle,
  }) {
    return loadedEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersStateLoadingLoaded value)? loaded,
    TResult Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult Function(OrdersStateLoading value)? loading,
    TResult Function(OrdersStateLoadingError value)? error,
    TResult Function(OrdersStateLoadingIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loadedEmpty != null) {
      return loadedEmpty(this);
    }
    return orElse();
  }
}

abstract class OrdersStateLoadingLoadedEmpty
    implements OrdersState, OrdersStateBuilder {
  const factory OrdersStateLoadingLoadedEmpty() =
      _$OrdersStateLoadingLoadedEmptyImpl;
}

/// @nodoc
abstract class _$$OrdersStateLoadingImplCopyWith<$Res> {
  factory _$$OrdersStateLoadingImplCopyWith(_$OrdersStateLoadingImpl value,
          $Res Function(_$OrdersStateLoadingImpl) then) =
      __$$OrdersStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrdersStateLoadingImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateLoadingImpl>
    implements _$$OrdersStateLoadingImplCopyWith<$Res> {
  __$$OrdersStateLoadingImplCopyWithImpl(_$OrdersStateLoadingImpl _value,
      $Res Function(_$OrdersStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrdersStateLoadingImpl implements OrdersStateLoading {
  const _$OrdersStateLoadingImpl();

  @override
  String toString() {
    return 'OrdersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrdersStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)
        loaded,
    required TResult Function() loadedEmpty,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult? Function()? loadedEmpty,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult Function()? loadedEmpty,
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
    required TResult Function(OrdersStateLoadingLoaded value) loaded,
    required TResult Function(OrdersStateLoadingLoadedEmpty value) loadedEmpty,
    required TResult Function(OrdersStateLoading value) loading,
    required TResult Function(OrdersStateLoadingError value) error,
    required TResult Function(OrdersStateLoadingIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersStateLoadingLoaded value)? loaded,
    TResult? Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult? Function(OrdersStateLoading value)? loading,
    TResult? Function(OrdersStateLoadingError value)? error,
    TResult? Function(OrdersStateLoadingIdle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersStateLoadingLoaded value)? loaded,
    TResult Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult Function(OrdersStateLoading value)? loading,
    TResult Function(OrdersStateLoadingError value)? error,
    TResult Function(OrdersStateLoadingIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrdersStateLoading implements OrdersState, OrdersStateBuilder {
  const factory OrdersStateLoading() = _$OrdersStateLoadingImpl;
}

/// @nodoc
abstract class _$$OrdersStateLoadingErrorImplCopyWith<$Res> {
  factory _$$OrdersStateLoadingErrorImplCopyWith(
          _$OrdersStateLoadingErrorImpl value,
          $Res Function(_$OrdersStateLoadingErrorImpl) then) =
      __$$OrdersStateLoadingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$OrdersStateLoadingErrorImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateLoadingErrorImpl>
    implements _$$OrdersStateLoadingErrorImplCopyWith<$Res> {
  __$$OrdersStateLoadingErrorImplCopyWithImpl(
      _$OrdersStateLoadingErrorImpl _value,
      $Res Function(_$OrdersStateLoadingErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OrdersStateLoadingErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$OrdersStateLoadingErrorImpl implements OrdersStateLoadingError {
  const _$OrdersStateLoadingErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'OrdersState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateLoadingErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersStateLoadingErrorImplCopyWith<_$OrdersStateLoadingErrorImpl>
      get copyWith => __$$OrdersStateLoadingErrorImplCopyWithImpl<
          _$OrdersStateLoadingErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)
        loaded,
    required TResult Function() loadedEmpty,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult? Function()? loadedEmpty,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult Function()? loadedEmpty,
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
    required TResult Function(OrdersStateLoadingLoaded value) loaded,
    required TResult Function(OrdersStateLoadingLoadedEmpty value) loadedEmpty,
    required TResult Function(OrdersStateLoading value) loading,
    required TResult Function(OrdersStateLoadingError value) error,
    required TResult Function(OrdersStateLoadingIdle value) idle,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersStateLoadingLoaded value)? loaded,
    TResult? Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult? Function(OrdersStateLoading value)? loading,
    TResult? Function(OrdersStateLoadingError value)? error,
    TResult? Function(OrdersStateLoadingIdle value)? idle,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersStateLoadingLoaded value)? loaded,
    TResult Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult Function(OrdersStateLoading value)? loading,
    TResult Function(OrdersStateLoadingError value)? error,
    TResult Function(OrdersStateLoadingIdle value)? idle,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrdersStateLoadingError
    implements OrdersState, OrdersStateBuilder {
  const factory OrdersStateLoadingError(final Object error) =
      _$OrdersStateLoadingErrorImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$OrdersStateLoadingErrorImplCopyWith<_$OrdersStateLoadingErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersStateLoadingIdleImplCopyWith<$Res> {
  factory _$$OrdersStateLoadingIdleImplCopyWith(
          _$OrdersStateLoadingIdleImpl value,
          $Res Function(_$OrdersStateLoadingIdleImpl) then) =
      __$$OrdersStateLoadingIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrdersStateLoadingIdleImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateLoadingIdleImpl>
    implements _$$OrdersStateLoadingIdleImplCopyWith<$Res> {
  __$$OrdersStateLoadingIdleImplCopyWithImpl(
      _$OrdersStateLoadingIdleImpl _value,
      $Res Function(_$OrdersStateLoadingIdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrdersStateLoadingIdleImpl implements OrdersStateLoadingIdle {
  const _$OrdersStateLoadingIdleImpl();

  @override
  String toString() {
    return 'OrdersState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateLoadingIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)
        loaded,
    required TResult Function() loadedEmpty,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult? Function()? loadedEmpty,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders, Order? orderToDelete,
            int deletionCountdownValue)?
        loaded,
    TResult Function()? loadedEmpty,
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
    required TResult Function(OrdersStateLoadingLoaded value) loaded,
    required TResult Function(OrdersStateLoadingLoadedEmpty value) loadedEmpty,
    required TResult Function(OrdersStateLoading value) loading,
    required TResult Function(OrdersStateLoadingError value) error,
    required TResult Function(OrdersStateLoadingIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersStateLoadingLoaded value)? loaded,
    TResult? Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult? Function(OrdersStateLoading value)? loading,
    TResult? Function(OrdersStateLoadingError value)? error,
    TResult? Function(OrdersStateLoadingIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersStateLoadingLoaded value)? loaded,
    TResult Function(OrdersStateLoadingLoadedEmpty value)? loadedEmpty,
    TResult Function(OrdersStateLoading value)? loading,
    TResult Function(OrdersStateLoadingError value)? error,
    TResult Function(OrdersStateLoadingIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class OrdersStateLoadingIdle implements OrdersState {
  const factory OrdersStateLoadingIdle() = _$OrdersStateLoadingIdleImpl;
}
