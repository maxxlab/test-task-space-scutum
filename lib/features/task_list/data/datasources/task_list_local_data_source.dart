import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_scutum_test/core/constants/string_constants.dart';
import 'package:space_scutum_test/core/params/params.dart';
import '../models/task_model.dart';

abstract class TaskListLocalDataSource {
  Future<List<TaskModel>> loadTasks();
  Future<void> saveTasks({required List<TaskModel> tasks});
  Future<List<TaskModel>> filterTasks(
      {required TasksFilterParams tasksFilterParams});
}

class TaskListLocalDataSourceImpl implements TaskListLocalDataSource {
  final SharedPreferences _sharedPreferences;

  TaskListLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<List<TaskModel>> loadTasks() async {
    final prefs = _sharedPreferences;
    // await prefs.clear();
    final encodedTasks = prefs.getStringList(kTasks);
    if (encodedTasks == null) return [];
    return encodedTasks.map((json) => TaskModel.fromJson(json)).toList();
  }

  @override
  Future<void> saveTasks({required List<TaskModel> tasks}) async {
    final prefs = _sharedPreferences;
    final encodedTasks = tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(kTasks, encodedTasks);
  }

  @override
  Future<List<TaskModel>> filterTasks(
      {required TasksFilterParams tasksFilterParams}) async {
        final loadedTasks = await loadTasks();
    if (tasksFilterParams.completed != null) {
      return loadedTasks
          .where((task) => task.completed == tasksFilterParams.completed)
          .toList();
    } else if (tasksFilterParams.categoryEnum != null) {
      return loadedTasks
          .where((task) => task.categoryEnum == tasksFilterParams.categoryEnum)
          .toList();
    } else {
      return loadedTasks;
    }
  }
}
