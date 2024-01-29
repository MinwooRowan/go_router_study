import 'package:flutter/material.dart';
import 'package:go_router_study/provider/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends ChangeNotifier {
  final Ref _ref;
  AuthNotifier(this._ref) {
    _ref.listen<AuthStateEnum>(authProvider, (previous, next) {
      notifyListeners();
    });
  }
}
