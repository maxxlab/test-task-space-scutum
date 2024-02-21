import 'package:space_scutum_test/core/params/params.dart';
import 'package:space_scutum_test/features/task_list/business/entities/task_entity.dart';
import '../../business/repositories/task_list_repository.dart';
import '../datasources/task_list_local_data_source.dart';
import '../models/task_model.dart';

class TaskListRepositoryImpl implements TaskListRepository {
  final TaskListLocalDataSource localDataSource;

  TaskListRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<List<TaskEntity>> loadTasks() async {
    List<TaskEntity> loadedTasks = await localDataSource.loadTasks();

    return loadedTasks;
  }

  @override
  Future<void> saveTasks({required List<TaskModel> tasks}) async {
    await localDataSource.saveTasks(tasks: tasks);
  }

  @override
  Future<List<TaskEntity>> filterTasks(
      {required TasksFilterParams tasksFilterParams}) async {
    List<TaskEntity> filteredTasks =
        await localDataSource.filterTasks(tasksFilterParams: tasksFilterParams);
        
    return filteredTasks;
  }
}
