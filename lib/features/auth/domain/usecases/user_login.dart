import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

class UserLogin implements UseCase<UserModel, UserLoginParams> {
  final AuthRepository authRepository;

  const UserLogin(this.authRepository);

  @override
  Future<Either<Failure, UserModel>> call(UserLoginParams params) {
    return authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

final class UserLoginParams extends Params {
  final String email;
  final String password;

  const UserLoginParams({
    required this.email,
    required this.password,
  });
}
