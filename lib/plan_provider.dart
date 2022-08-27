import 'package:flutter/material.dart';

import './controllers/plan_controller.dart';
import './di/locator.dart';

class PlanProvider extends InheritedWidget {
  final _controller = locator<PlanController>();

  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static PlanController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._controller;
  }
}
