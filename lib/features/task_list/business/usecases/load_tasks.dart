import '../entities/task_entity.dart';
import '../repositories/task_list_repository.dart';

class LoadTasksUseCase {
  final TaskListRepository taskListRepository;

  LoadTasksUseCase({required this.taskListRepository});

  Future<List<TaskEntity>> call() async {
    return await taskListRepository.loadTasks();
  }
}
