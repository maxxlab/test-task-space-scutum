import 'package:dartz/dartz.dart';
import 'package:space_scutum_test/features/task_list/data/models/task_model.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/task_entity.dart';

abstract class TaskListRepository {
  Future<List<TaskEntity>> loadTasks();
  Future<void> saveTasks({required List<TaskModel> tasks});
  Future<List<TaskEntity>> filterTasks(
      {required TasksFilterParams tasksFilterParams});
}
