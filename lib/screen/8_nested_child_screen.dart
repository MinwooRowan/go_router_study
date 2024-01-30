import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NestedChildScreen extends StatefulHookConsumerWidget {
  final String routeName;
  const NestedChildScreen({super.key, required this.routeName});

  @override
  ConsumerState<NestedChildScreen> createState() => _NestedChildScreenState();
}

class _NestedChildScreenState extends ConsumerState<NestedChildScreen> {
  @override
  Widget build(BuildContext context) {
    final routeName = useState(widget.routeName);
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              routeName.value = 'Changed Text';
            },
            child: const Text('Change Text Button'),
          ),
          Text(routeName.value),
        ],
      ),
    );
  }
}
