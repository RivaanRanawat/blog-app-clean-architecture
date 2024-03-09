import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../secrets/app_secrets.dart';

part 'supabase_providers.g.dart';

@Riverpod(keepAlive: true)
Future<Supabase> supabase(SupabaseRef ref) {
  return Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
}

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(SupabaseClientRef ref) =>
    throw UnimplementedError();
