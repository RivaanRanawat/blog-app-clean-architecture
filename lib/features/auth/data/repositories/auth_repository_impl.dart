import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Session;

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../../../../core/network/connection_checker_mixin.dart';
import '../../../../core/typedefs/functional_typedefs.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl with ConnectionCheckerMixin implements AuthRepository {
  @override
  final ConnectionChecker connectionChecker;
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  FutureEither<UserModel> currentUser() async {
    try {
      if (!await isConnected()) {
        final Session? session = remoteDataSource.currentUserSession;
        if (session == null) {
          return left(Failure('User not logged in!'));
        }
        return right(
          UserModel(
            id: session.user.id,
            email: session.user.email ?? '',
            name: '',
          ),
        );
      }
      final UserModel? user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in!'));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  FutureEither<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  FutureEither<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  FutureEither<UserModel> _getUser(Future<UserModel> Function() fn) {
    return validateConnection(() async {
      try {
        final UserModel user = await fn();
        return right(user);
      } on ServerException catch (e) {
        return left(Failure(e.message));
      }
    });
  }
}
