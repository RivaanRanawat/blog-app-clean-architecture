import '../typedefs/functional_typedefs.dart';

abstract interface class UseCase<SuccessType, T extends Params> {
  FutureEither<SuccessType> call(T params);
}

abstract base class Params {
  const Params();
}

final class NoParams extends Params {}
