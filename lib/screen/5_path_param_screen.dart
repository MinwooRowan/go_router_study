import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_study/layout/default_layout.dart';

class PathParamScreen extends StatelessWidget {
  static const String route = 'path_param';
  const PathParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        Text('Path Param : ${GoRouterState.of(context).pathParameters}'),
        ElevatedButton(
          onPressed: () {
            context.go('/home/${PathParamScreen.route}/minwoo/:0528');
          },
          child: const Text('Path Param'),
        )
      ],
    ));
  }
}
