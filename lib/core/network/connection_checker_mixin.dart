import 'package:fpdart/fpdart.dart';

import '../constants/constants.dart';
import '../error/failures.dart';
import '../typedefs/functional_typedefs.dart';
import 'connection_checker.dart';

abstract mixin class ConnectionCheckerMixin {
  /// The connection checker Interface
  ConnectionChecker get connectionChecker;

  /// Check if the device is connected to the internet
  Future<bool> isConnected() => connectionChecker.isConnected;

  /// Check if the device is connected to the internet using a functional
  /// approach
  FutureEither<T> validateConnectivity<T>(FutureEither<T> Function() f) async {
    if (!await isConnected()) {
      return left(Failure(Constants.noConnectionErrorMessage));
    }
    return f();
  }
}
