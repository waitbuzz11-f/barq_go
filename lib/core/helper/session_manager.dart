import 'constants.dart';
import 'shared_pref_helper.dart';
import '../routing/app_navigator.dart';
import '../widgets/session_expired_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SessionManager {
  SessionManager(this._dio);

  final Dio _dio;

  bool _isShowing = false;
  Future<void>? _clearSessionOperation;

  Future<void> clearSession() {
    final currentOperation = _clearSessionOperation;
    if (currentOperation != null) return currentOperation;

    final operation = _clearAuthenticationData();
    _clearSessionOperation = operation;

    return operation.whenComplete(() {
      if (identical(_clearSessionOperation, operation)) {
        _clearSessionOperation = null;
      }
    });
  }

  Future<void> _clearAuthenticationData() async {
    await SharedPrefHelper.removeSecure(SharedPrefKeys.token);

    isLoggedInUser = false;
    _dio.options.headers.remove('Authorization');
    _dio.options.headers.remove('authorization');
  }

  Future<void> onSessionExpired() async {
    if (_isShowing) return;

    _isShowing = true;

    try {
      await clearSession();

      final context = navigatorKey.currentContext;

      if (context == null) return;

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const SessionExpiredDialog(),
      );
    } finally {
      _isShowing = false;
    }
  }
}
