import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/auth/data/models/user_model.dart';
import 'app_user_state.dart';

part 'app_user_notifier.g.dart';

@riverpod
class AppUserNotifier extends _$AppUserNotifier {
  @override
  AppUserState build() => const AppUserState.initial();

  void updateUser(UserModel? user) {
    if (user == null) {
      state = const AppUserState.initial();
    } else {
      state = AppUserState.loggedIn(user);
    }
  }
}
