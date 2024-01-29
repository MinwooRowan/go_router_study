import 'package:flutter/material.dart';
import 'package:go_router_study/layout/default_layout.dart';

class PushedSubScreen extends StatelessWidget {
  static const String route = 'pushedSub';
  const PushedSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text('Pushe Sub Screen'),
      ),
    );
  }
}
