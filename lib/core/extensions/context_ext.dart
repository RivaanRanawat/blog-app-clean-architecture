import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  /// Show a snackbar with the given [content]
  void showSnackBar(String content) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(content)));
  }

  /// Push to a route with the given [Widget] and return generic Type T
  Future<T?> push<T>(Widget widget) => Navigator.of(this)
      .push<T>(MaterialPageRoute<T>(builder: (BuildContext context) => widget));

  /// Push to a given route and clear the existing navigation stack
  Future<T?> pushAndRemoveUntil<T>(Widget widget) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute<T>(builder: (BuildContext context) => widget),
        (Route<dynamic> route) => false,
      );
}
