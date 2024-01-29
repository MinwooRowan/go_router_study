import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_study/layout/default_layout.dart';
import 'package:go_router_study/provider/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RedirectScreen extends ConsumerWidget {
  static const String route = 'redirect';
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Center(
        child: Column(
          children: [
            const Text('Redirect Screen'),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(RedirectScreen.route);
              },
              child: const Text('Go To Another Route'),
            ),
          ],
        ),
      ),
    );
  }
}
