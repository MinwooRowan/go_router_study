import 'package:flutter/material.dart';
import 'package:go_router_study/layout/default_layout.dart';

class PushedScreen extends StatelessWidget {
  static const String route = 'pushed';
  const PushedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text('Pushed Screen'),
      ),
    );
  }
}
