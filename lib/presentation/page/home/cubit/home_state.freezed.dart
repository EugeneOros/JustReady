// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, String path) selectedPage,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, String path)? selectedPage,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, String path)? selectedPage,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectedPageState value) selectedPage,
    required TResult Function(IdleState value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectedPageState value)? selectedPage,
    TResult? Function(IdleState value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectedPageState value)? selectedPage,
    TResult Function(IdleState value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SelectedPageStateImplCopyWith<$Res> {
  factory _$$SelectedPageStateImplCopyWith(_$SelectedPageStateImpl value,
          $Res Function(_$SelectedPageStateImpl) then) =
      __$$SelectedPageStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, String path});
}

/// @nodoc
class __$$SelectedPageStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SelectedPageStateImpl>
    implements _$$SelectedPageStateImplCopyWith<$Res> {
  __$$SelectedPageStateImplCopyWithImpl(_$SelectedPageStateImpl _value,
      $Res Function(_$SelectedPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? path = null,
  }) {
    return _then(_$SelectedPageStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedPageStateImpl implements SelectedPageState {
  const _$SelectedPageStateImpl({required this.index, required this.path});

  @override
  final int index;
  @override
  final String path;

  @override
  String toString() {
    return 'HomeState.selectedPage(index: $index, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedPageStateImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedPageStateImplCopyWith<_$SelectedPageStateImpl> get copyWith =>
      __$$SelectedPageStateImplCopyWithImpl<_$SelectedPageStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, String path) selectedPage,
    required TResult Function() idle,
  }) {
    return selectedPage(index, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, String path)? selectedPage,
    TResult? Function()? idle,
  }) {
    return selectedPage?.call(index, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, String path)? selectedPage,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (selectedPage != null) {
      return selectedPage(index, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectedPageState value) selectedPage,
    required TResult Function(IdleState value) idle,
  }) {
    return selectedPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectedPageState value)? selectedPage,
    TResult? Function(IdleState value)? idle,
  }) {
    return selectedPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectedPageState value)? selectedPage,
    TResult Function(IdleState value)? idle,
    required TResult orElse(),
  }) {
    if (selectedPage != null) {
      return selectedPage(this);
    }
    return orElse();
  }
}

abstract class SelectedPageState implements HomeState {
  const factory SelectedPageState(
      {required final int index,
      required final String path}) = _$SelectedPageStateImpl;

  int get index;
  String get path;
  @JsonKey(ignore: true)
  _$$SelectedPageStateImplCopyWith<_$SelectedPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IdleStateImplCopyWith<$Res> {
  factory _$$IdleStateImplCopyWith(
          _$IdleStateImpl value, $Res Function(_$IdleStateImpl) then) =
      __$$IdleStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$IdleStateImpl>
    implements _$$IdleStateImplCopyWith<$Res> {
  __$$IdleStateImplCopyWithImpl(
      _$IdleStateImpl _value, $Res Function(_$IdleStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleStateImpl implements IdleState {
  const _$IdleStateImpl();

  @override
  String toString() {
    return 'HomeState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, String path) selectedPage,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, String path)? selectedPage,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, String path)? selectedPage,
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
    required TResult Function(SelectedPageState value) selectedPage,
    required TResult Function(IdleState value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectedPageState value)? selectedPage,
    TResult? Function(IdleState value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectedPageState value)? selectedPage,
    TResult Function(IdleState value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdleState implements HomeState {
  const factory IdleState() = _$IdleStateImpl;
}
