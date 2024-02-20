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
    List<TaskEntity> tasks = await localDataSource.loadTasks();

    return tasks;
  }

  @override
  Future<void> saveTasks({required List<TaskModel> tasks}) async {
    await localDataSource.saveTasks(tasks: tasks);
  }
}
