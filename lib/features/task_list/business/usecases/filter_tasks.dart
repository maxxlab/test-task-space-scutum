import 'package:space_scutum_test/core/params/params.dart';

import '../entities/task_entity.dart';
import '../repositories/task_list_repository.dart';

class FilterTasksUseCase {
  final TaskListRepository taskListRepository;

  FilterTasksUseCase({required this.taskListRepository});

  Future<List<TaskEntity>> call(
      {required TasksFilterParams tasksFilterParams}) async {
    return await taskListRepository.filterTasks(
        tasksFilterParams: tasksFilterParams);
  }
}
