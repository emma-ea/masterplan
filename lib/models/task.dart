import 'package:flutter/foundation.dart';
import '../repositories/repository.dart';

class Task {
  final int id;
  String description;
  bool complete;

  Task({required this.id, this.description = "", this.complete = false});

  Task.fromModel(Model model)
      : id = model.id,
        description = model.data['description'],
        complete = model.data['complete'];

  Model toModel() =>
      Model(id: id, data: {'description': description, 'complete': complete});
}
