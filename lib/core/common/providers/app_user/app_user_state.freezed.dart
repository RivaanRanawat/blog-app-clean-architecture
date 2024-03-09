// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserModel user) loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserModel user)? loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserModel user)? loggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppUserInitial value) initial,
    required TResult Function(_AppUserLoggedIn value) loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppUserInitial value)? initial,
    TResult? Function(_AppUserLoggedIn value)? loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppUserInitial value)? initial,
    TResult Function(_AppUserLoggedIn value)? loggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserStateCopyWith<$Res> {
  factory $AppUserStateCopyWith(
          AppUserState value, $Res Function(AppUserState) then) =
      _$AppUserStateCopyWithImpl<$Res, AppUserState>;
}

/// @nodoc
class _$AppUserStateCopyWithImpl<$Res, $Val extends AppUserState>
    implements $AppUserStateCopyWith<$Res> {
  _$AppUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppUserInitialImplCopyWith<$Res> {
  factory _$$AppUserInitialImplCopyWith(_$AppUserInitialImpl value,
          $Res Function(_$AppUserInitialImpl) then) =
      __$$AppUserInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppUserInitialImplCopyWithImpl<$Res>
    extends _$AppUserStateCopyWithImpl<$Res, _$AppUserInitialImpl>
    implements _$$AppUserInitialImplCopyWith<$Res> {
  __$$AppUserInitialImplCopyWithImpl(
      _$AppUserInitialImpl _value, $Res Function(_$AppUserInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppUserInitialImpl extends _AppUserInitial {
  const _$AppUserInitialImpl() : super._();

  @override
  String toString() {
    return 'AppUserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppUserInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserModel user) loggedIn,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserModel user)? loggedIn,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserModel user)? loggedIn,
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
    required TResult Function(_AppUserInitial value) initial,
    required TResult Function(_AppUserLoggedIn value) loggedIn,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppUserInitial value)? initial,
    TResult? Function(_AppUserLoggedIn value)? loggedIn,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppUserInitial value)? initial,
    TResult Function(_AppUserLoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AppUserInitial extends AppUserState {
  const factory _AppUserInitial() = _$AppUserInitialImpl;
  const _AppUserInitial._() : super._();
}

/// @nodoc
abstract class _$$AppUserLoggedInImplCopyWith<$Res> {
  factory _$$AppUserLoggedInImplCopyWith(_$AppUserLoggedInImpl value,
          $Res Function(_$AppUserLoggedInImpl) then) =
      __$$AppUserLoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AppUserLoggedInImplCopyWithImpl<$Res>
    extends _$AppUserStateCopyWithImpl<$Res, _$AppUserLoggedInImpl>
    implements _$$AppUserLoggedInImplCopyWith<$Res> {
  __$$AppUserLoggedInImplCopyWithImpl(
      _$AppUserLoggedInImpl _value, $Res Function(_$AppUserLoggedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AppUserLoggedInImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AppUserLoggedInImpl extends _AppUserLoggedIn {
  const _$AppUserLoggedInImpl(this.user) : super._();

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AppUserState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserLoggedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserLoggedInImplCopyWith<_$AppUserLoggedInImpl> get copyWith =>
      __$$AppUserLoggedInImplCopyWithImpl<_$AppUserLoggedInImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserModel user) loggedIn,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserModel user)? loggedIn,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserModel user)? loggedIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppUserInitial value) initial,
    required TResult Function(_AppUserLoggedIn value) loggedIn,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppUserInitial value)? initial,
    TResult? Function(_AppUserLoggedIn value)? loggedIn,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppUserInitial value)? initial,
    TResult Function(_AppUserLoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _AppUserLoggedIn extends AppUserState {
  const factory _AppUserLoggedIn(final UserModel user) = _$AppUserLoggedInImpl;
  const _AppUserLoggedIn._() : super._();

  UserModel get user;
  @JsonKey(ignore: true)
  _$$AppUserLoggedInImplCopyWith<_$AppUserLoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
