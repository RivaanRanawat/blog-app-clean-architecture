import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/common/providers/app_user/app_user_notifier.dart';
import 'core/common/providers/app_user/app_user_state.dart';
import 'core/common/providers/supabase/supabase_providers.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/blog/presentation/pages/blog_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  final ProviderContainer container = ProviderContainer();
  final Supabase supabase = await container.read(supabaseProvider.future);
  runApp(
    UncontrolledProviderScope(
      container: container
        ..updateOverrides(
          <Override>[
            supabaseClientProvider.overrideWithValue(supabase.client),
          ],
        ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: Consumer(
        child: const BlogPage(),
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final bool isLoggedIn = ref.watch(appUserNotifierProvider
              .select((AppUserState value) => value.isLoggedIn));
          if (isLoggedIn) child!;
          return const LoginPage();
        },
      ),
    );
  }
}
