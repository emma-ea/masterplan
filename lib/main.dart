import 'package:flutter/material.dart';

import './views/views_layer.dart';
import './plan_provider.dart';

void main() => runApp(PlanProvider(child: const MasterPlanApp()));

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PlanCreatorScreen(),
    );
  }
}
