import 'package:flutter/material.dart';
import 'package:go_router_study/layout/default_layout.dart';

class GoNamedScreen extends StatelessWidget {
  static const String route = 'goNamed';
  const GoNamedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text('Go Named Screen'),
      ),
    );
  }
}
