import '../../../../core/typedefs/functional_typedefs.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

final class CurrentUser implements UseCase<UserModel, NoParams> {
  final AuthRepository authRepository;

  const CurrentUser(this.authRepository);

  @override
  FutureEither<UserModel> call(NoParams params) => authRepository.currentUser();
}
