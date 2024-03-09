import '../../../../core/typedefs/functional_typedefs.dart';

import '../../data/models/user_model.dart';

abstract interface class AuthRepository {
  /// Create a new user with email and password
  FutureEither<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  /// Login with email and password
  FutureEither<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  /// Get the current user
  FutureEither<UserModel> currentUser();
}
