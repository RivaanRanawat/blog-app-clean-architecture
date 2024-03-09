import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_providers.g.dart';

@riverpod
Supabase supabase(SupabaseRef ref) => throw UnimplementedError();

@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) =>
    ref.watch(supabaseProvider.select((Supabase value) => value.client));
