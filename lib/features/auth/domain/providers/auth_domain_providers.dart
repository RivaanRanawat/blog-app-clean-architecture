import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/providers/network/connection_notifier.dart';
import '../../../../core/common/providers/supabase/supabase_providers.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repository/auth_repository.dart';

part 'auth_domain_providers.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl(ref.read(supabaseClientProvider));
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
    connectionChecker: ref.read(connectionCheckerProvider),
  );
}
