
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

abstract class TaskListLocalDataSource {
  Future<List<TaskModel>> loadTasks();
  Future<void> saveTasks({required List<TaskModel> tasks});
}

class TaskListLocalDataSourceImpl implements TaskListLocalDataSource {
  final SharedPreferences _sharedPreferences;

  TaskListLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<List<TaskModel>> loadTasks() async {
    final prefs = _sharedPreferences;
    final encodedTasks = prefs.getStringList('tasks');
    if (encodedTasks == null) return [];
    return encodedTasks.map((json) => TaskModel.fromJson(json)).toList();
  }

  @override
  Future<void> saveTasks({required List<TaskModel> tasks}) async {
    final prefs = _sharedPreferences;
    final encodedTasks = tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList('tasks', encodedTasks);
  }
}
