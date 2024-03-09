import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/providers/app_user/app_user_notifier.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/typedefs/functional_typedefs.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../../domain/providers/auth_usecase_providers.dart';
import '../../domain/usecases/user_login.dart';
import '../../domain/usecases/user_sign_up.dart';

part 'auth_notifier.g.dart';
part 'auth_state.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Raw<FutureOr<AuthState>> build() async {
    final EitherFailure<UserModel> res =
        await ref.read(currentUserUseCaseProvider).call(NoParams());
    return res.fold(
      (Failure l) => const AuthInitial(),
      (UserModel r) {
        ref.read(appUserNotifierProvider.notifier).updateUser(r);
        return AuthSuccess(r);
      },
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = Future<AuthState>.value(const AuthLoading());
    final EitherFailure<UserModel> res = await ref
        .read(userSignUpUseCaseProvider)
        .call(UserSignUpParams(email: email, password: password, name: name));
    final AuthState updatedState = res.fold(
      (Failure l) => AuthFailure(l.message),
      AuthSuccess.new,
    );
    state = Future<AuthState>.value(updatedState);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = Future<AuthState>.value(const AuthLoading());
    final EitherFailure<UserModel> res = await ref
        .read(userLoginUseCaseProvider)
        .call(UserLoginParams(email: email, password: password));
    final AuthState updatedState = res.fold(
      (Failure l) => AuthFailure(l.message),
      AuthSuccess.new,
    );
    state = Future<AuthState>.value(updatedState);
  }
}
