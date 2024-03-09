import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecases/current_user.dart';
import '../usecases/user_login.dart';
import '../usecases/user_sign_up.dart';
import 'auth_domain_providers.dart';

part 'auth_usecase_providers.g.dart';

@riverpod
CurrentUser currentUserUseCase(CurrentUserUseCaseRef ref) {
  return CurrentUser(ref.read(authRepositoryProvider));
}

@riverpod
UserLogin userLoginUseCase(UserLoginUseCaseRef ref) {
  return UserLogin(ref.read(authRepositoryProvider));
}

@riverpod
UserSignUp userSignUpUseCase(UserSignUpUseCaseRef ref) {
  return UserSignUp(ref.read(authRepositoryProvider));
}
