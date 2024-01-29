import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_study/layout/default_layout.dart';
import 'package:go_router_study/provider/auth_provider.dart';
import 'package:go_router_study/screen/1_go_screen.dart';
import 'package:go_router_study/screen/2_go_named_screen.dart';
import 'package:go_router_study/screen/3_pushed_screen.dart';
import 'package:go_router_study/screen/4_pushed_sub_screen.dart';
import 'package:go_router_study/screen/5_path_param_screen.dart';
import 'package:go_router_study/screen/6_query_param_screen.dart';
import 'package:go_router_study/screen/9_redirect_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  static const String route = 'home';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/${HomeScreen.route}/${GoScreen.route}/home2');
              // equal to
            },
            child: const Text('Go To Go Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(GoNamedScreen.route);
              // equal to
            },
            child: const Text('Go To Go Named Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(PushedScreen.route);
              // equal to
            },
            child: const Text('Push Pushed Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(PushedSubScreen.route);
              // equal to
            },
            child: const Text('go Named Sub Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .go('/${HomeScreen.route}/${PathParamScreen.route}/minwoo');
            },
            child: const Text('Go Path Param'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/${HomeScreen.route}/${QueryParameterScreen.route}');
            },
            child: const Text('Go Query Parameter'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/${HomeScreen.route}/nested/a');
            },
            child: const Text('Go Nested'),
          ),
          TextButton(
              onPressed: () {
                ref.read(authProvider.notifier).login();
              },
              child: Text('Login')),
          ElevatedButton(
            onPressed: () {
              context.goNamed(RedirectScreen.route);
            },
            child: const Text('Go Redirect Screen'),
          ),
        ],
      ),
    );
  }
}
