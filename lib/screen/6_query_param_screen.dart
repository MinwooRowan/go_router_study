import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_study/layout/default_layout.dart';
import 'package:go_router_study/screen/home_screen.dart';

class QueryParameterScreen extends StatelessWidget {
  static const String route = 'query_param';
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        Text(
          'Query Param : ${GoRouterState.of(context).uri.queryParameters}',
        ),
        // '/query_parame?name=minwoo&age=28'
        ElevatedButton(
          onPressed: () {
            context.push(
              Uri(
                path: '/${HomeScreen.route}/${QueryParameterScreen.route}',
                queryParameters: {
                  'name': 'minwoo',
                  'age': '28',
                },
              ).toString(),
            );
            print(Uri(
              path: '/${HomeScreen.route}/${QueryParameterScreen.route}',
              queryParameters: {
                'name': 'minwoo',
                'age': '28',
              },
            ).toString());
          },
          child: const Text('Query Parameter'),
        )
      ],
    ));
  }
}
