import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/providers/network/connection_notifier.dart';
import '../../../../core/common/providers/supabase/supabase_providers.dart';
import '../../data/datasources/blog_local_data_source.dart';
import '../../data/datasources/blog_remote_data_source.dart';
import '../../data/repositories/blog_repository_impl.dart';
import '../repositories/blog_repository.dart';

part 'blog_domain_providers.g.dart';

@riverpod
// ignore: always_specify_types
Box blogStorageBox(BlogStorageBoxRef ref) => Hive.box(name: 'blogs');

@riverpod
BlogRepository blogRepository(BlogRepositoryRef ref) {
  return BlogRepositoryImpl(
    blogRemoteDataSource: ref.read(blogRemoteDataSourceProvider),
    blogLocalDataSource: ref.read(blogLocalDataSourceProvider),
    connectionChecker: ref.read(connectionCheckerProvider),
  );
}

@riverpod
BlogRemoteDataSource blogRemoteDataSource(BlogRemoteDataSourceRef ref) {
  return BlogRemoteDataSourceImpl(ref.read(supabaseClientProvider));
}

@riverpod
BlogLocalDataSource blogLocalDataSource(BlogLocalDataSourceRef ref) {
  return BlogLocalDataSourceImpl(ref.watch(blogStorageBoxProvider));
}
