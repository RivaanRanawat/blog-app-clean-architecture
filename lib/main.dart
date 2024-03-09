import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/common/providers/supabase/supabase_providers.dart';
import 'core/secrets/app_secrets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  final Supabase supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      supabaseProvider.overrideWithValue(supabase),
    ],
  );
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
