import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_study/screen/home_screen.dart';

class NestedScreen extends StatelessWidget {
  static const String route = 'nested';
  final Widget child;
  const NestedScreen({required this.child, super.key});

  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).matchedLocation ==
        '${NestedScreen.route}/a') {
      return 0;
    } else if (GoRouterState.of(context).matchedLocation ==
        '${NestedScreen.route}/b') {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouterState.of(context).matchedLocation}}'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: getIndex(context),
        onTap: (index) {
          if (index == 0) {
            context.go('/${HomeScreen.route}/${NestedScreen.route}/a');
          } else if (index == 1) {
            context.go('/${HomeScreen.route}/${NestedScreen.route}/b');
          } else if (index == 2) {
            context.go('/${HomeScreen.route}/${NestedScreen.route}/c');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
