import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/common/providers/app_user/app_user_notifier.dart';
import 'core/common/providers/app_user/app_user_state.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/blog/presentation/pages/blog_page.dart';

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
          if (isLoggedIn) return child!;
          return const LoginPage();
        },
      ),
    );
  }
}
