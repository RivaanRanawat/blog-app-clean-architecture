// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$internetConnectionHash() =>
    r'3ffb7a82ca29eaeba555eaef462f3f82e8c2cc0e';

/// See also [internetConnection].
@ProviderFor(internetConnection)
final internetConnectionProvider = Provider<InternetConnection>.internal(
  internetConnection,
  name: r'internetConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$internetConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InternetConnectionRef = ProviderRef<InternetConnection>;
String _$connectionCheckerHash() => r'063bbaaccf9f7559210ede0d7e01d545c39e07eb';

/// See also [connectionChecker].
@ProviderFor(connectionChecker)
final connectionCheckerProvider =
    AutoDisposeProvider<ConnectionChecker>.internal(
  connectionChecker,
  name: r'connectionCheckerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectionCheckerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectionCheckerRef = AutoDisposeProviderRef<ConnectionChecker>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
