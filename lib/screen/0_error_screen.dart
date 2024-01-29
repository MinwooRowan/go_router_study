import 'package:flutter/material.dart';
import 'package:go_router_study/layout/default_layout.dart';

class ErrorScreen extends StatelessWidget {
  static const String route = 'go';
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text('Error Screen'),
      ),
    );
  }
}
