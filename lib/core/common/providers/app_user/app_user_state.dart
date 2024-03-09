import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/auth/data/models/user_model.dart';

part 'app_user_state.freezed.dart';

@freezed
sealed class AppUserState with _$AppUserState {
  const AppUserState._();

  const factory AppUserState.initial() = _AppUserInitial;

  const factory AppUserState.loggedIn(UserModel user) = _AppUserLoggedIn;

  /// Returns `true` if the user is logged in, otherwise `false`.
  bool get isLoggedIn => maybeMap(loggedIn: (_) => true, orElse: () => false);

  /// Get the userId of the user if logged in, otherwise `null`.
  String? get userIdOrNull => whenOrNull(loggedIn: (UserModel user) => user.id);
}
