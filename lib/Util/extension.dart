
import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {
  void navigateTo(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
extension NavigationRemoveContext on BuildContext {
  void navigateAndRemove(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
          (route) => false,
    );
  }
}


