import 'package:space_scutum_test/features/task_list/data/models/task_model.dart';

import '../repositories/task_list_repository.dart';

class SaveTasks {
  final TaskListRepository taskListRepository;

  SaveTasks({required this.taskListRepository});

  Future<void> call({
    required List<TaskModel> tasks,
  }) async {
    return await taskListRepository.saveTasks(tasks: tasks);
  }
}
