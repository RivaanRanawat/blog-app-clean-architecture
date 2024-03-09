import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../network/connection_checker.dart';

part 'connection_notifier.g.dart';

@Riverpod(keepAlive: true)
InternetConnection internetConnection(Ref ref) => InternetConnection();

@riverpod
ConnectionChecker connectionChecker(Ref ref) {
  return ConnectionCheckerImpl(ref.watch(internetConnectionProvider));
}
