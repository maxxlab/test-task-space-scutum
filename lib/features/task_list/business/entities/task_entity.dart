import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/features/task_list/data/models/task_model.dart';

class TaskEntity {
  final String id;
  final String title;
  final String description;
  final bool completed;
  final CategoryEnum categoryEnum;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.categoryEnum,
  });
}

extension ConvertModel on TaskEntity {
  TaskModel toTaskModel() {
    return TaskModel(
      id: id,
      title: title,
      description: description,
      completed: completed,
      categoryEnum: categoryEnum,
    );
  }
}
