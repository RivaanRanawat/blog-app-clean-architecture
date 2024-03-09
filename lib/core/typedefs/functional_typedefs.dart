import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

/// Functional type definition for Future
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherUnit = FutureEither<Unit>;

/// Functional type definition for Either
typedef EitherFailure<T> = Either<Failure, T>;
