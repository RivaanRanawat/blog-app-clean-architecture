import '../../../../core/typedefs/functional_typedefs.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

class UserSignUp implements UseCase<UserModel, UserSignUpParams> {
  final AuthRepository authRepository;

  const UserSignUp(this.authRepository);

  @override
  FutureEither<UserModel> call(UserSignUpParams params) {
    return authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

final class UserSignUpParams extends Params {
  final String email;
  final String password;
  final String name;

  const UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
