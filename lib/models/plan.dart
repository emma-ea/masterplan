import '../repositories/repository.dart';
import './task.dart';

class Plan {
  final int id;
  String name = "";
  List<Task> tasks = [];

  int get completeCount => tasks.where((element) => element.complete).length;

  String get completenessMsg => '$completeCount out of ${tasks.length} tasks';

  Plan({required this.id, this.name = ""});

  Plan.fromModel(Model model)
    : id = model.id,
    name = model.data['name'],
    tasks = model.data['task']
      ?.map<Task>((task) => Task.fromModel(task))?.toList() ?? <Task>[];

  Model toModel() => Model(id: id, data: {"name": name, "tasks": tasks});
}
