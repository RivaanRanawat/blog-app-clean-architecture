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
  FutureOr<AuthState> build() async {
    final EitherFailure<UserModel> result =
        await ref.read(currentUserUseCaseProvider).call(NoParams());
    return result.fold((Failure l) => const AuthInitial(), (UserModel r) {
      ref.read(appUserNotifierProvider.notifier).updateUser(r);
      return AuthSuccess(r);
    });
  }

  @override
  set state(AsyncValue<AuthState> value) {
    /// We have overrident this method so that if the user is authenticated
    /// we enter the details of the user into the appUserNotifierProvider
    /// and rebuild the widget tree and redirect the user into the app
    super.state = value.whenData((AuthState value) {
      if (value is AuthSuccess) {
        ref.read(appUserNotifierProvider.notifier).updateUser(value.user);
      }
      return value;
    });
  }

  /// Create a new user and enter into the app
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const AsyncLoading<AuthState>();
    final EitherFailure<UserModel> result = await ref
        .read(userSignUpUseCaseProvider)
        .call(UserSignUpParams(email: email, password: password, name: name));
    result.fold(
      (Failure l) => state = AsyncError<AuthState>(l, StackTrace.current),
      (UserModel user) => state = AsyncData<AuthState>(AuthSuccess(user)),
    );
  }

  /// Login user into the app
  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading<AuthState>();
    final EitherFailure<UserModel> result = await ref
        .read(userLoginUseCaseProvider)
        .call(UserLoginParams(email: email, password: password));
    result.fold(
      (Failure l) => state = AsyncError<AuthState>(l, StackTrace.current),
      (UserModel user) => state = AsyncData<AuthState>(AuthSuccess(user)),
    );
  }
}
