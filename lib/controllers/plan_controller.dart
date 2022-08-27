import '../models/data_layer.dart';
import '../services/plan_services.dart';
import '../di/locator.dart';

class PlanController {
  final PlanServices _services = locator<PlanServices>();

  List<Plan> get plans => List.unmodifiable(_services.getAllPlans());

  void addNewPlan(String name) {
    if (name.isEmpty) {
      return;
    }

    name = _checkForDuplicates(plans.map((e) => e.name), name);
    _services.createPlan(name);
  }

  void savePlan(Plan plan) {
    _services.savePlan(plan);
  }

  void deletePlan(Plan plan) {
    _services.delete(plan);
  }

  void createNewTasks(Plan plan, [String description = ""]) {
    if (description.isEmpty) {
      description = "New Task";
    }

    description =
        _checkForDuplicates(plan.tasks.map((e) => e.description), description);
    _services.addTask(plan, description);
  }

  void deleteTask(Plan plan, Task task) {
    _services.deleteTask(plan, task);
  }

  String _checkForDuplicates(Iterable<String> items, String text) {
    final duplicatedCount =
        items.where((element) => element.contains(text)).length;

    if (duplicatedCount > 0) {
      text += '${duplicatedCount + 1}';
    }
    return text;
  }
}
