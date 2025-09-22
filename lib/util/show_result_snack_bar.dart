import 'package:flutter/material.dart';

/// async 함수의 결과에 따라 스낵바를 표시하는 유틸리티
class ShowResultSnackBar {
  /// 성공/실패 메시지를 받아서 스낵바를 표시하는 함수
  static Future<void> showResult(
    BuildContext context,
    Future<bool> Function() asyncFunction, {
    required String successMessage,
    required String failureMessage,
    void Function()? onSuccess,
    void Function(dynamic error)? onFailure,
  }) async {
    try {
      final success = await asyncFunction();

      if (success && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(successMessage)));
        onSuccess?.call();
      } else {
        throw Exception(failureMessage);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$failureMessage: $e')));
        onFailure?.call(e);
      }
    }
  }
}
