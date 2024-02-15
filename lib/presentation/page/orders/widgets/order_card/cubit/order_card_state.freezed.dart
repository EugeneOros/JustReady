// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderCardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool showCountdown, int countdown) loaded,
    required TResult Function() deleteOrder,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool showCountdown, int countdown)? loaded,
    TResult? Function()? deleteOrder,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool showCountdown, int countdown)? loaded,
    TResult Function()? deleteOrder,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(DeleteOrder value) deleteOrder,
    required TResult Function(Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DeleteOrder value)? deleteOrder,
    TResult? Function(Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(DeleteOrder value)? deleteOrder,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCardStateCopyWith<$Res> {
  factory $OrderCardStateCopyWith(
          OrderCardState value, $Res Function(OrderCardState) then) =
      _$OrderCardStateCopyWithImpl<$Res, OrderCardState>;
}

/// @nodoc
class _$OrderCardStateCopyWithImpl<$Res, $Val extends OrderCardState>
    implements $OrderCardStateCopyWith<$Res> {
  _$OrderCardStateCopyWithImpl(this._value, this._then);

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
  $Res call({bool showCountdown, int countdown});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$OrderCardStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showCountdown = null,
    Object? countdown = null,
  }) {
    return _then(_$LoadedImpl(
      showCountdown: null == showCountdown
          ? _value.showCountdown
          : showCountdown // ignore: cast_nullable_to_non_nullable
              as bool,
      countdown: null == countdown
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl({required this.showCountdown, required this.countdown});

  @override
  final bool showCountdown;
  @override
  final int countdown;

  @override
  String toString() {
    return 'OrderCardState.loaded(showCountdown: $showCountdown, countdown: $countdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.showCountdown, showCountdown) ||
                other.showCountdown == showCountdown) &&
            (identical(other.countdown, countdown) ||
                other.countdown == countdown));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showCountdown, countdown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool showCountdown, int countdown) loaded,
    required TResult Function() deleteOrder,
    required TResult Function() idle,
  }) {
    return loaded(showCountdown, countdown);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool showCountdown, int countdown)? loaded,
    TResult? Function()? deleteOrder,
    TResult? Function()? idle,
  }) {
    return loaded?.call(showCountdown, countdown);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool showCountdown, int countdown)? loaded,
    TResult Function()? deleteOrder,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(showCountdown, countdown);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(DeleteOrder value) deleteOrder,
    required TResult Function(Idle value) idle,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DeleteOrder value)? deleteOrder,
    TResult? Function(Idle value)? idle,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(DeleteOrder value)? deleteOrder,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements OrderCardState, OrderCardStateBuilder {
  const factory Loaded(
      {required final bool showCountdown,
      required final int countdown}) = _$LoadedImpl;

  bool get showCountdown;
  int get countdown;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteOrderImplCopyWith<$Res> {
  factory _$$DeleteOrderImplCopyWith(
          _$DeleteOrderImpl value, $Res Function(_$DeleteOrderImpl) then) =
      __$$DeleteOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteOrderImplCopyWithImpl<$Res>
    extends _$OrderCardStateCopyWithImpl<$Res, _$DeleteOrderImpl>
    implements _$$DeleteOrderImplCopyWith<$Res> {
  __$$DeleteOrderImplCopyWithImpl(
      _$DeleteOrderImpl _value, $Res Function(_$DeleteOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteOrderImpl implements DeleteOrder {
  const _$DeleteOrderImpl();

  @override
  String toString() {
    return 'OrderCardState.deleteOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool showCountdown, int countdown) loaded,
    required TResult Function() deleteOrder,
    required TResult Function() idle,
  }) {
    return deleteOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool showCountdown, int countdown)? loaded,
    TResult? Function()? deleteOrder,
    TResult? Function()? idle,
  }) {
    return deleteOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool showCountdown, int countdown)? loaded,
    TResult Function()? deleteOrder,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (deleteOrder != null) {
      return deleteOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(DeleteOrder value) deleteOrder,
    required TResult Function(Idle value) idle,
  }) {
    return deleteOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DeleteOrder value)? deleteOrder,
    TResult? Function(Idle value)? idle,
  }) {
    return deleteOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(DeleteOrder value)? deleteOrder,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (deleteOrder != null) {
      return deleteOrder(this);
    }
    return orElse();
  }
}

abstract class DeleteOrder implements OrderCardState, OrderCardStateListener {
  const factory DeleteOrder() = _$DeleteOrderImpl;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$OrderCardStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl implements Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'OrderCardState.idle()';
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
    required TResult Function(bool showCountdown, int countdown) loaded,
    required TResult Function() deleteOrder,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool showCountdown, int countdown)? loaded,
    TResult? Function()? deleteOrder,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool showCountdown, int countdown)? loaded,
    TResult Function()? deleteOrder,
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
    required TResult Function(DeleteOrder value) deleteOrder,
    required TResult Function(Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DeleteOrder value)? deleteOrder,
    TResult? Function(Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(DeleteOrder value)? deleteOrder,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements OrderCardState, OrderCardStateBuilder {
  const factory Idle() = _$IdleImpl;
}
