import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '10_indexed_stack_bottom_screen.g.dart';

@riverpod
class IndexStack extends _$IndexStack {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

class IndexedStackScreen extends HookConsumerWidget {
  static const String route = 'stack';
  const IndexedStackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final string1 = useState('1');
    final string2 = useState('2');
    final string3 = useState('3');
    return Scaffold(
        appBar: AppBar(
          title: const Text('IndexedStack'),
        ),
        body: IndexedStack(
          index: ref.watch(indexStackProvider),
          children: [
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      string1.value = 'Changed Text';
                    },
                    child: const Text('Change Text Button'),
                  ),
                  Text(string1.value),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      string2.value = 'Changed Text';
                    },
                    child: const Text('Change Text Button'),
                  ),
                  Text(string2.value),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      string3.value = 'Changed Text';
                    },
                    child: const Text('Change Text Button'),
                  ),
                  Text(string3.value),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(indexStackProvider),
          onTap: (index) {
            ref.read(indexStackProvider.notifier).setIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Mail',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Person',
            ),
          ],
        ));
  }
}
