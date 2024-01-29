import 'package:go_router/go_router.dart';
import 'package:go_router_study/provider/auth_notifier.dart';
import 'package:go_router_study/provider/auth_provider.dart';
import 'package:go_router_study/screen/0_error_screen.dart';
import 'package:go_router_study/screen/1_go_screen.dart';
import 'package:go_router_study/screen/2_go_named_screen.dart';
import 'package:go_router_study/screen/3_pushed_screen.dart';
import 'package:go_router_study/screen/4_pushed_sub_screen.dart';
import 'package:go_router_study/screen/5_path_param_screen.dart';
import 'package:go_router_study/screen/6_query_param_screen.dart';
import 'package:go_router_study/screen/7_nested_screen.dart';
import 'package:go_router_study/screen/8_nested_child_screen.dart';
import 'package:go_router_study/screen/9_redirect_screen.dart';
import 'package:go_router_study/screen/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final AuthNotifier authNotifier = AuthNotifier(ref);

  return GoRouter(
    initialLocation: '/${HomeScreen.route}',
    refreshListenable: authNotifier,
    //App사용중 redirect가 5번이상 발생하면 에러페이지로 이동
    redirectLimit: 5,
    redirect: (context, state) {
      final AuthStateEnum authState = ref.read(authProvider);
      if (state.matchedLocation != '/${HomeScreen.route}') {
        if (authState == AuthStateEnum.logout) {
          return '/${HomeScreen.route}';
        }
      }
      return null;
    },
    errorBuilder: (context, state) {
      return const ErrorScreen();
    },
    routes: [
      GoRoute(
        path: '/${HomeScreen.route}',
        name: HomeScreen.route,
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: '${GoScreen.route}/home2',
            name: '${GoScreen.route}/home2',
            builder: (context, state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: GoScreen.route,
            name: GoScreen.route,
            builder: (context, state) {
              return const GoScreen();
            },
          ),
          GoRoute(
            path: GoNamedScreen.route,
            name: GoNamedScreen.route,
            builder: (context, state) {
              return const GoNamedScreen();
            },
          ),
          GoRoute(
            path: '${PathParamScreen.route}/:id',
            builder: (context, state) {
              // /pop/return
              return const PathParamScreen();
            },
            routes: [
              GoRoute(
                path: ':name',
                builder: (context, state) {
                  return const PathParamScreen();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'query_param',
            builder: (context, state) {
              return const QueryParameterScreen();
            },
          ),
          ShellRoute(
            builder: (context, state, child) {
              return NestedScreen(child: child);
            },
            routes: [
              GoRoute(
                path: '${NestedScreen.route}/a',
                builder: (context, state) {
                  return const NestedChildScreen(
                      routeName: '/${NestedScreen.route}/a');
                },
              ),
              GoRoute(
                path: '${NestedScreen.route}/b',
                builder: (context, state) {
                  return const NestedChildScreen(
                      routeName: '/${NestedScreen.route}/b');
                },
              ),
              GoRoute(
                path: '${NestedScreen.route}/c',
                builder: (context, state) {
                  return const NestedChildScreen(
                      routeName: '/${NestedScreen.route}/c');
                },
              ),
            ],
          ),
          GoRoute(
            path: RedirectScreen.route,
            name: RedirectScreen.route,
            builder: (context, state) {
              return const RedirectScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/${PushedScreen.route}',
        name: PushedScreen.route,
        builder: (context, state) {
          return const PushedScreen();
        },
        routes: [
          GoRoute(
            path: PushedSubScreen.route,
            name: PushedSubScreen.route,
            builder: (context, state) {
              return const PushedSubScreen();
            },
            routes: [],
          ),
        ],
      ),
    ],
  );
}
