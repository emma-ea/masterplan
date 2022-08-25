import 'package:flutter/material.dart';

import '../plan_provider.dart';
import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({Key? key, required this.plan}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlanScreenState();
  }
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Plan get plan => widget.plan;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        final controller = PlanProvider.of(context);
        controller.savePlan(plan);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Master Plan")),
        body: Column(
          children: <Widget>[
            Expanded(
              child: _buildList(),
            ),
            SafeArea(
              child: Text(plan.completenessMsg),
            ),
          ],
        ),
        floatingActionButton: _buildAddTaskButton(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) {
        return _buildTaskPile(plan.tasks[index]);
      },
      controller: scrollController,
    );
  }

  Widget _buildTaskPile(Task task) {
    return Dismissible(
      key: ValueKey(task),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        PlanProvider.of(context).deleteTask(plan, task);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              task.complete = selected!;
            });
          },
        ),
        title: TextFormField(
          initialValue: task.description,
          onChanged: (text) {
            setState(() {
              task.description = text;
            });
          },
        ),
      ),
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        PlanProvider.of(context).createNewTasks(plan);
        setState(() {});
      },
    );
  }
}
