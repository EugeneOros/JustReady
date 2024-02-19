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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(List<Order> readyOrders) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(List<Order> readyOrders)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(List<Order> readyOrders)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnnounceReady value) announceReady,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Initial value)? initial,
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
    required TResult Function(List<Order> readyOrders) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() initial,
  }) {
    return loaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(List<Order> readyOrders)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? initial,
  }) {
    return loaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(List<Order> readyOrders)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? initial,
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements DashboardState {
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
  $Res call({List<Order> readyOrders});
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
    Object? readyOrders = null,
  }) {
    return _then(_$AnnounceReadyImpl(
      null == readyOrders
          ? _value._readyOrders
          : readyOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

class _$AnnounceReadyImpl implements AnnounceReady {
  const _$AnnounceReadyImpl(final List<Order> readyOrders)
      : _readyOrders = readyOrders;

  final List<Order> _readyOrders;
  @override
  List<Order> get readyOrders {
    if (_readyOrders is EqualUnmodifiableListView) return _readyOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readyOrders);
  }

  @override
  String toString() {
    return 'DashboardState.announceReady(readyOrders: $readyOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnounceReadyImpl &&
            const DeepCollectionEquality()
                .equals(other._readyOrders, _readyOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_readyOrders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnounceReadyImplCopyWith<_$AnnounceReadyImpl> get copyWith =>
      __$$AnnounceReadyImplCopyWithImpl<_$AnnounceReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(List<Order> readyOrders) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() initial,
  }) {
    return announceReady(readyOrders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(List<Order> readyOrders)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? initial,
  }) {
    return announceReady?.call(readyOrders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(List<Order> readyOrders)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (announceReady != null) {
      return announceReady(readyOrders);
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (announceReady != null) {
      return announceReady(this);
    }
    return orElse();
  }
}

abstract class AnnounceReady implements DashboardState {
  const factory AnnounceReady(final List<Order> readyOrders) =
      _$AnnounceReadyImpl;

  List<Order> get readyOrders;
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
    required TResult Function(List<Order> readyOrders) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() initial,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(List<Order> readyOrders)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? initial,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(List<Order> readyOrders)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? initial,
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements DashboardState {
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
    required TResult Function(List<Order> readyOrders) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() initial,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(List<Order> readyOrders)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? initial,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(List<Order> readyOrders)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? initial,
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements DashboardState {
  const factory Error(final Object error) = _$ErrorImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DashboardState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Order> orders) loaded,
    required TResult Function(List<Order> readyOrders) announceReady,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Order> orders)? loaded,
    TResult? Function(List<Order> readyOrders)? announceReady,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Order> orders)? loaded,
    TResult Function(List<Order> readyOrders)? announceReady,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
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
    required TResult Function(Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(AnnounceReady value)? announceReady,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(AnnounceReady value)? announceReady,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DashboardState {
  const factory Initial() = _$InitialImpl;
}
